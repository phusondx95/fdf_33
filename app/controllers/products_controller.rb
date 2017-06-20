class ProductsController < ApplicationController
  
  def index
    @products = Product.paginate page: params[:page], per_page: Settings.product_limit
  end
end
