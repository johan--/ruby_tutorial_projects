require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  let(:valid_attributes) {
    { name: "tag name" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tags as @tags" do
      tag = Tag.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe "GET #show" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes
      get :show, {:id => tag.to_param}, valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end
end
