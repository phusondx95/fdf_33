class ProductsController < ApplicationController
  before_action :load_categories, except: :destroy
  before_action :load_product, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.order_by_id.paginate page: params[:page], per_page: Settings.product_limit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "products_controller.creates"
      redirect_to products_path
    else
      flash[:danger] = t "products_controller.createf"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "products_controller.updates"
      redirect_to products_path
    else
      flash[:danger] = t "products_controller.updatef"
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "products_controller.deletes"
      redirect_to products_url
    else
      flash[:danger] = t "products_controller.deletef"
      render :index
    end
  end

  private

  def product_params
    params.require(:product).permit :title, :description, :image_url, :price, :category_id
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "products_controller.notfound"
    redirect_to root_url
  end

  def load_categories
    @categories = Category.sub_category
  end
end
