class OrdersController < ApplicationController

  def create
    @products = current_user.carted_products.where(status: "carted")
    @order = Order.new({user_id: current_user.id})
    @products.each do |product|
      @order.subtotal = product.product.price * product.quantity
    end
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax
    

    if @order.save

      @products.update_all(status: "purchased", order_id: @order.id)

      redirect_to "/products"

      flash[:success] = "Your purchase was completed"
    else
      redirect_to "/carted_products"
    end

  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
