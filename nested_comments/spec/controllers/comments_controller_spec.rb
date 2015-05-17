require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns comment to comments var' do
      pending('Figure out how the hash_tree method express a single comment')
      comment = create(:comment)

      get :index, {}

      expect(assigns(:comments)).to eq([comment])
    end

    it 'assigns comments to comments var' do
      pending('Figure out how the hash_tree method express multiple root comments')
      comment = create(:comment)
      comment2 = create(:comment)

      get :index, {}

      expect(assigns(:comments)).to eq([comment, comment2])
    end

    it 'assigns nested comments to comments var' do
      pending('Figure out how the hash_tree method express nested comments')
      comment = create(:comment)
      comment2 = create(:comment).merge(parent_id: comment.id)

      get :index, {}

      expect(assigns(:comments)).to eq([comment, comment2])
    end
  end

  describe 'GET new' do
    it 'renders new template' do
      get :new

      expect(response).to render_template :new
    end
  end

  describe 'POST create' do
    it 'valid attributes raise Comment count by 1' do
      valid_attributes = { title: 'Title', author: 'Author', body: 'Body'}

      expect{
        post :create, { comment: valid_attributes}
      }.to change(Comment, :count).by(1)
    end

    it 'redirects to root after valid create' do
      valid_attributes = { title: 'Title', author: 'Author', body: 'Body'}

      post :create, { comment: valid_attributes}

      expect(response).to redirect_to root_url
    end

    it 'renders new after invalid create' do
      invalid_attributes = { title: nil, author: nil, body: nil}

      post :create, { comment: invalid_attributes}

      expect(response).to render_template :new
    end
  end
end
