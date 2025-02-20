require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:order) { Order.create(id: 1, status: 'unsubmitted')}

  let(:valid_attributes) {
    { product_id: 1, order_id: order.id, quantity: 1 }
  }

  let(:invalid_attributes) {
    { product_id: nil, order_id: nil, quantity: 1}
  }

  let(:valid_session) { 
    { order_id: order.id , user_id: 1} 
  }

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
        expect(response).to redirect_to(order)
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
        { product_id: 1, order_id: order.id, quantity: 5 }
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
        expect(response).to redirect_to(order_path(order))
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
      expect(response).to redirect_to(order_path(order))
    end
  end

end
