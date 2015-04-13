require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # OrderItem. As you add validations to OrderItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { product_id: 1, order_id: 1, quantity: 1 }
  }

  let(:invalid_attributes) {
    { product_id: nil, order_id: nil, quantity: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrderItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all order_items as @order_items" do
      order_item = OrderItem.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:order_items)).to eq([order_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested order_item as @order_item" do
      order_item = OrderItem.create! valid_attributes
      get :show, {:id => order_item.to_param}, valid_session
      expect(assigns(:order_item)).to eq(order_item)
    end
  end

  describe "GET #new" do
    it "assigns a new order_item as @order_item" do
      get :new, {}, valid_session
      expect(assigns(:order_item)).to be_a_new(OrderItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order_item as @order_item" do
      order_item = OrderItem.create! valid_attributes
      get :edit, {:id => order_item.to_param}, valid_session
      expect(assigns(:order_item)).to eq(order_item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new OrderItem" do
        expect {
          post :create, {:order_item => valid_attributes}, valid_session
        }.to change(OrderItem, :count).by(1)
      end

      it "assigns a newly created order_item as @order_item" do
        post :create, {:order_item => valid_attributes}, valid_session
        expect(assigns(:order_item)).to be_a(OrderItem)
        expect(assigns(:order_item)).to be_persisted
      end

      it "redirects to the created order_item" do
        post :create, {:order_item => valid_attributes}, valid_session
        expect(response).to redirect_to(OrderItem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order_item as @order_item" do
        post :create, {:order_item => invalid_attributes}, valid_session
        expect(assigns(:order_item)).to be_a_new(OrderItem)
      end

      it "re-renders the 'new' template" do
        post :create, {:order_item => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { product_id: 1, order_id: 1, quantity: 5 }
      }

      it "updates the requested order_item" do
        order_item = OrderItem.create! valid_attributes
        put :update, {:id => order_item.to_param, :order_item => new_attributes}, valid_session
        order_item.reload
        expect(order_item.quantity).to eq(5)
      end

      it "assigns the requested order_item as @order_item" do
        order_item = OrderItem.create! valid_attributes
        put :update, {:id => order_item.to_param, :order_item => valid_attributes}, valid_session
        expect(assigns(:order_item)).to eq(order_item)
      end

      it "redirects to the order_item" do
        order_item = OrderItem.create! valid_attributes
        put :update, {:id => order_item.to_param, :order_item => valid_attributes}, valid_session
        expect(response).to redirect_to(order_item)
      end
    end

    context "with invalid params" do
      it "assigns the order_item as @order_item" do
        order_item = OrderItem.create! valid_attributes
        put :update, {:id => order_item.to_param, :order_item => invalid_attributes}, valid_session
        expect(assigns(:order_item)).to eq(order_item)
      end

      it "re-renders the 'edit' template" do
        order_item = OrderItem.create! valid_attributes
        put :update, {:id => order_item.to_param, :order_item => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order_item" do
      order_item = OrderItem.create! valid_attributes
      expect {
        delete :destroy, {:id => order_item.to_param}, valid_session
      }.to change(OrderItem, :count).by(-1)
    end

    it "redirects to the order_items list" do
      order_item = OrderItem.create! valid_attributes
      delete :destroy, {:id => order_item.to_param}, valid_session
      expect(response).to redirect_to(order_items_url)
    end
  end

end
