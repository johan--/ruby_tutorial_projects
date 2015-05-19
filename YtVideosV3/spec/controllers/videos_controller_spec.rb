require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET new' do
    it 'renders new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST create' do
    let(:valid_attributes) {
      { link: 'https://youtu.be/1Y_pbbRyneo' }
    }

    let(:invalid_attributes) {
      { link: nil }
    }

    it 'increases video count by one' do
      expect {
        post :create, { video: valid_attributes }
      }.to change(Video, :count).by(1)
    end

    it 'redirects with valid attributes' do
      post :create, { video: valid_attributes }
      expect(response).to redirect_to root_path
    end

    it 'renders no with invalid params' do
      post :create, { video: invalid_attributes }
      expect(response).to render_template :new
    end
  end
end
