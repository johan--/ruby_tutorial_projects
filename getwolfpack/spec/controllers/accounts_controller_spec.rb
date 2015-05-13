require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:account_attributes) do
    FactoryGirl.attributes_for(:account).
      merge(owner_attributes: FactoryGirl.attributes_for(:user))
  end

  describe '#new' do
    it 'shows new account form' do
      get :new

      expect(response).to be_success
      expect(response).to render_template(:new)
      expect(assigns(:account)).to be_instance_of Account
      expect(assigns(:account).owner).to be_instance_of User
    end
  end

  describe '#create' do
    it 'creates new account' do
      expect {
        expect {
          post :create, account: account_attributes
        }.to change(User, :count).by(1)
      }.to change(Account, :count).by(1)

      expect(response).to redirect_to(root_url)
    end

    it 'renders form for invalid params' do
      post :create, account: { owner_attributes: { first_name: '' } }

      expect(response).to render_template(:new)
    end
  end

end
