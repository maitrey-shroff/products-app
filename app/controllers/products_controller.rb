class ProductsController < ApplicationController

  def home
    @products = Product.all
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def save_product
    @product = Product.new({product_name: params[:product_name], description: params[:description], image: params[:image], price: params[:price]})
    @product.save

    flash[:success] = "Product saved!"

    redirect_to "/products"
  end

  def edit
    @products = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes({product_name: params[:product_name], description: params[:description], image: params[:image], price: params[:price]})
    product.save

    flash[:info] = "Product updated!"

    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    flash[:danger] = "Product deleted!"

    redirect_to "/products"
  end

end