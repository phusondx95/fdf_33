class OrdersController < ApplicationController
  include CartOrder
  include ProductLib
  before_action :verify_admin, only: [:index, :update, :destroy]
  before_action :set_cart, only: [:new, :create]
  before_action :check_cart_status, only: :new
  before_action :load_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all.newest.paginate page: params[:page], per_page: Settings.order_limit 
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    add_line_items_to_order @cart, @order
    @order.user = current_user
    if @order.save
      Cart.destroy session[:cart_id]
      session[:cart_id] = nil
      send_mail @order
      flash[:success] = t "orders_controller.submit"
      redirect_to products_path
    else
      flash[:danger] = t "orders_controller.submitf"
      render :new
    end
  end

  def show
  end

  def update
    if @order.update order_status_param
      flash[:success] = t "orders_controller.updates"
      if @order.status == t "orders_controller.shipped"
        sold_units_of_product @order
      end
    else
      flash[:danger] = t "orders_controller.updatef"
    end
    send_mail @order
    redirect_to :back
  end

  def destroy
    if @order.destroy
      flash[:success] = t "orders_controller.deletes"
    else
      flash[:danger] = t "orders_controller.deletef"
    end
    redirect_to :back
  end

  private

  def load_order
    @order = Order.find_by id: params[:id]
    return if @order
    flash[:danger] = t "orders_controller.notfound"
    redirect_to orders_path
  end

  def order_params
    params.require(:order).permit :name, :email, :address, :pay_type
  end

  def order_status_param
    params.require(:order).permit :status
  end
end