class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:edit, :update, :destroy]
  before_action :load_order, only: [:create]

  def edit
  end

  def create
    @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end

    def load_order
      @order = Order.find_or_initialize_by_id(session[:order_id], status: "unsubmitted")
      if @order.new_record?
        @order.save!
        session[:order_id] = @order.id
      end
    end
end
