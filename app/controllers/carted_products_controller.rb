class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.new({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted"})
    @carted_product.save

    redirect_to "/carted_products"

    flash[:success] = "The product was added to the cart"

  end

  def checkout
    @carted_products = CartedProduct.find_by(id: current_user.id)
    @carted_products = CartedProduct.where(status: "carted")
  end

end
