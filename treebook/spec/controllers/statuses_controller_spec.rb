require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe StatusesController, type: :controller do
  let!(:different_user) { create(:user) }
  let!(:status) { create(:status) }
  let!(:default_params) {  {profile_name: status.user } }

  # This should return the minimal set of attributes required to create a valid
  # Status. As you add validations to Status, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StatusesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all statuses as @statuses" do
      status = Status.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:statuses)).to eq([status])
    end
  end

  describe "GET #show" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :show, {:id => status.to_param}, valid_session
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "GET #new" do
    it "assigns a new status as @status" do
      get :new, {}, valid_session
      expect(assigns(:status)).to be_a_new(Status)
    end
  end

  describe "GET #edit" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :edit, {:id => status.to_param}, valid_session
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Status" do
        expect {
          post :create, {:status => valid_attributes}, valid_session
        }.to change(Status, :count).by(1)
      end

      it "assigns a newly created status as @status" do
        post :create, {:status => valid_attributes}, valid_session
        expect(assigns(:status)).to be_a(Status)
        expect(assigns(:status)).to be_persisted
      end

      it "redirects to the created status" do
        post :create, {:status => valid_attributes}, valid_session
        expect(response).to redirect_to(Status.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved status as @status" do
        post :create, {:status => invalid_attributes}, valid_session
        expect(assigns(:status)).to be_a_new(Status)
      end

      it "re-renders the 'new' template" do
        post :create, {:status => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => new_attributes}, valid_session
        status.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes}, valid_session
        expect(assigns(:status)).to eq(status)
      end

      it "redirects to the status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes}, valid_session
        expect(response).to redirect_to(status)
      end
    end

    context "with invalid params" do
      it "assigns the status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => invalid_attributes}, valid_session
        expect(assigns(:status)).to eq(status)
      end

      it "re-renders the 'edit' template" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested status" do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, {:id => status.to_param}, valid_session
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the statuses list" do
      status = Status.create! valid_attributes
      delete :destroy, {:id => status.to_param}, valid_session
      expect(response).to redirect_to(statuses_url)
    end
  end

end
