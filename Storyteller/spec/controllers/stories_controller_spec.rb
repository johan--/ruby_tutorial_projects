require 'rails_helper'

RSpec.describe StoriesController, type: :controller do

  let(:valid_attributes) {
    { title: 'Title', body: 'Body' }
  }

  let(:invalid_attributes) {
    { title: nil, body: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all stories as @stories" do
      story = Story.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:stories)).to eq([story])
    end
  end

  describe "GET #show" do
    it "assigns the requested story as @story" do
      story = Story.create! valid_attributes
      get :show, {:id => story.to_param}, valid_session
      expect(assigns(:story)).to eq(story)
    end
  end

  describe "GET #new" do
    it "assigns a new story as @story" do
      get :new, {}, valid_session
      expect(assigns(:story)).to be_a_new(Story)
    end
  end

  describe "GET #edit" do
    it "assigns the requested story as @story" do
      story = Story.create! valid_attributes
      get :edit, {:id => story.to_param}, valid_session
      expect(assigns(:story)).to eq(story)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Story" do
        expect {
          post :create, {:story => valid_attributes}, valid_session
        }.to change(Story, :count).by(1)
      end

      it "assigns a newly created story as @story" do
        post :create, {:story => valid_attributes}, valid_session
        expect(assigns(:story)).to be_a(Story)
        expect(assigns(:story)).to be_persisted
      end

      it "redirects to the root path" do
        post :create, {:story => valid_attributes}, valid_session
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved story as @story" do
        post :create, {:story => invalid_attributes}, valid_session
        expect(assigns(:story)).to be_a_new(Story)
      end

      it "re-renders the 'new' template" do
        post :create, {:story => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'New title', body: 'New body' }
      }

      it "updates the requested story" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => new_attributes}, valid_session
        story.reload
        expect(story.title).to eq('New title')
        expect(story.body).to eq('New body')
      end

      it "assigns the requested story as @story" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => valid_attributes}, valid_session
        expect(assigns(:story)).to eq(story)
      end

      it "redirects to the root path" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => valid_attributes}, valid_session
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid params" do
      it "assigns the story as @story" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => invalid_attributes}, valid_session
        expect(assigns(:story)).to eq(story)
      end

      it "re-renders the 'edit' template" do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested story" do
      story = Story.create! valid_attributes
      expect {
        delete :destroy, {:id => story.to_param}, valid_session
      }.to change(Story, :count).by(-1)
    end

    it "redirects to the root path" do
      story = Story.create! valid_attributes
      delete :destroy, {:id => story.to_param}, valid_session
      expect(response).to redirect_to root_path
    end
  end

end
