class ProductsController < ApplicationController

  def home
    @products = Product.all
  end


end