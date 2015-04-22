require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do 
    let(:user) { User.create(email: "example@rails.com",
                             password: "password",
                             password_confirmation: "password") }
   
    it "render index view" do
      sign_in user
      get :index
      expect(response).to render_template("index")
    end
  end

end
