class OrdersController < ApplicationController

  def create
    @order = Order.new({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity]})
    @order.save

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
