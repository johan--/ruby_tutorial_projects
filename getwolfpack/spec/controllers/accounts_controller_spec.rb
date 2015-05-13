require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:account_attributes) do
    FactoryGirl.attributes_for(:account).
      merge(owner_attributes: FactoryGirl.attributes_for(:user))
  end

  describe '#new' do
    before do
      get :new
    end

    it 'shows new account form' do
      expect(response).to be_success
      expect(response).to render_template(:new)
    end

    it 'assigns account as an instance of Account' do
      expect(assigns(:account)).to be_instance_of Account
    end

    it 'assigns acount owner as an inctance of User' do
      expect(assigns(:account).owner).to be_instance_of User
    end
  end

  describe '#create' do
    it 'creates new account' do
      expect {
        post :create, account: account_attributes
      }.to change(Account, :count).by(1)

      expect(response).to redirect_to(root_url)
    end

    it 'creates a new user' do
      expect {
        post :create, account: account_attributes
      }.to change(User, :count).by(1)
    end

    it 'renders form for invalid params' do
      post :create, account: { owner_attributes: { first_name: '' } }

      expect(response).to render_template(:new)
    end
  end

end
