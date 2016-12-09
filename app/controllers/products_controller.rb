class ProductsController < ApplicationController

  before_action :authenticate_user!

  def home
    @products = Product.all
  end

  def index

    if params[:category_name]
      category = Category.find_by(category_name: params[:category_name])
      @products = category.products
    else
      @products = Product.all
    end


    sort_order = params[:sort]
    if sort_order == "price_high"
      @products = @products.order(price: :desc)
    elsif sort_order == "price_low"
      @products = @products.order(price: :asc)
    elsif sort_order == "name_low"
      @products = @products.order(product_name: :asc)
    elsif sort_order == "name_high"
      @products = @products.order(product_name: :desc)
    elsif sort_order == "discount"
      @products = @products.where("price < ?", 1000)
    end
  end

  def show
    rando = params[:id]
    if rando == "random"
      @product = Product.order("RANDOM()").first
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new({product_name: params[:product_name], description: params[:description], price: params[:price], supplier_id: 1})
    if @product.save
      @image = Image.new({image_1: params[:image], product_id: @product.id})
      @image.save
      flash[:success] = "Product saved!"
      redirect_to "/products"
    else
      render :new
    end
  end

  def edit
    @products = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes({
      product_name: params[:product_name], 
      description: params[:description], 
      image: params[:image], 
      price: params[:price],
      # supplier_id: params[:supplier_id], 
      user_id: current_user.id})
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