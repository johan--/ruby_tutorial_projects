require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe '#new' do
    it 'shows new account form' do
      get :new

      expect(response).to be_success
      expect(response).to render_template(:new)
      expect(assigns(:account)).to be_instance_of Account
      expect(assigns(:account).owner).to be_instance_of User
    end
  end

end
