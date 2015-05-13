require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe DashboardsController do
    let(:user) { FactoryGirl.create(:user) }
    let(:account) { FactoryGirl.create(:account, owner: user) }

    describe 'for user not signed in' do
      it 'redirects to sign in user is not signed in' do
        request.host = 'subdomain.prograils.io'

        get :show

        expect(response).to redirect_to(new_user_session_url(subdomain: 'subdomain'))
      end
    end

    describe 'for signed in user' do
      before do
        account # preload
        sign_in user
      end

      it 'renders show template if user is signed in' do
        request.host = "#{account.subdomain}.prograils.io"

        get :show

        expect(response).to be_success
        expect(response).to render_template(:show)
      end

      it 'redirects to subdomain if subdomain is absent for signed in user' do
        request.host = 'prograils.io'

        get :show

        expect(response).to redirect_to "http://#{account.subdomain}.prograils.io/"
      end

      it 'redirect to proper subdomain' do
        request.host = "wrong.prograils.io"

        get :show

        expect(response).to redirect_to "http://#{account.subdomain}.prograils.io/"
      end
    end

  end
end
