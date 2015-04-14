require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  let(:user) { User.create(name: "someone") }

  let(:valid_attributes) {
    { line1: "1 Street", 
      city: "Nowhere",
      state: "ZA",
      zip: "12345",
      user_id: 1}
  }

  let(:invalid_attributes) {
    { line1: nil,
      city: nil,
      state: nil,
      zip: nil,
      user_id: nil}
  }

  let(:valid_session) {
    { order_id: 1 , user_id: user.id}
  }

  describe "GET #index" do
    it "assigns all addresses as @addresses" do
      address = Address.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:addresses)).to eq([address])
    end
  end

  describe "GET #show" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :show, {:id => address.to_param}, valid_session
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "GET #new" do
    it "assigns a new address as @address" do
      get :new, {}, valid_session
      expect(assigns(:address)).to be_a_new(Address)
    end
  end

  describe "GET #edit" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :edit, {:id => address.to_param}, valid_session
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Address" do
        expect {
          post :create, {:address => valid_attributes}, valid_session
        }.to change(Address, :count).by(1)
      end

      it "assigns a newly created address as @address" do
        post :create, {:address => valid_attributes}, valid_session
        expect(assigns(:address)).to be_a(Address)
        expect(assigns(:address)).to be_persisted
      end

      it "redirects to the created address" do
        post :create, {:address => valid_attributes}, valid_session
        expect(response).to redirect_to(Address.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved address as @address" do
        post :create, {:address => invalid_attributes}, valid_session
        expect(assigns(:address)).to be_a_new(Address)
      end

      it "re-renders the 'new' template" do
        post :create, {:address => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested address" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => new_attributes}, valid_session
        address.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested address as @address" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => valid_attributes}, valid_session
        expect(assigns(:address)).to eq(address)
      end

      it "redirects to the address" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => valid_attributes}, valid_session
        expect(response).to redirect_to(address)
      end
    end

    context "with invalid params" do
      it "assigns the address as @address" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => invalid_attributes}, valid_session
        expect(assigns(:address)).to eq(address)
      end

      it "re-renders the 'edit' template" do
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested address" do
      address = Address.create! valid_attributes
      expect {
        delete :destroy, {:id => address.to_param}, valid_session
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the addresses list" do
      address = Address.create! valid_attributes
      delete :destroy, {:id => address.to_param}, valid_session
      expect(response).to redirect_to(addresses_url)
    end
  end

end
