class ProductsController < ApplicationController

  def home
    @products = Product.all
  end

  def index
    sort_order = params[:sort]
    if sort_order == "price_high"
      @products = Product.all.order(price: :desc)
    elsif sort_order == "price_low"
      @products = Product.all.order(price: :asc)
    elsif sort_order == "name_low"
      @products = Product.all.order(product_name: :asc)
    elsif sort_order == "name_high"
      @products = Product.all.order(product_name: :desc)
    elsif sort_order == "discount"
      @products = Product.where("price < ?", 1000)
    else
      @products = Product.all
    end
  end

  def show
    rando = params[:id]
    if rando == "random"
      @product = Product.order("RANDOM()").first
    else
      @product = Product.find_by(id: params[:id])
    end
    # @supplier = Supplier.find_by(id: @product.supplier_id)
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

  def search
    @search_term = params[:search_term]

    @products = Product.where("product_name ILIKE ?", "%#{@search_term}%")

    render :index
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    flash[:danger] = "Product deleted!"

    redirect_to "/products"
  end

end