require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  let(:valid_attributes) {
    { user_id: 1, status: 'unsubmitted' , address_id: 1}
  }

  let(:invalid_attributes) {
    { user_id: nil, status: nil, address_id: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "GET #new" do
    it "assigns a new order as @order" do
      get :new, {}, valid_session
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :edit, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, {:order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(response).to redirect_to(Order.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        post :create, {:order => invalid_attributes}, valid_session
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        post :create, {:order => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { user_id: 1, status: 'submitted' }
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => new_attributes}, valid_session
        order.reload
        expect(order.status).to eq('submitted')
      end

      it "assigns the requested order as @order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => valid_attributes}, valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "redirects to the order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => valid_attributes}, valid_session
        expect(response).to redirect_to(confirm_order_path(order))
      end
    end

    context "with invalid params" do
      it "assigns the order as @order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => invalid_attributes}, valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "re-renders the 'edit' template" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, {:id => order.to_param}, valid_session
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete :destroy, {:id => order.to_param}, valid_session
      expect(response).to redirect_to(products_path)
    end
  end

end
