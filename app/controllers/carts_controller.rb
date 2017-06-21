class CartsController < ApplicationController
  include CartOrder
  before_action :set_cart
  before_action :load_cart, only: :show

  def show
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    flash[:success] = t "carts_controller.deletes"
    redirect_to products_path
  end

  private

  def load_cart
    @cart = Cart.find_by id: params[:id]
    return if @cart && @cart.user_id == current_user.id
    flash[:danger] = t "carts_controller.notfound"
    redirect_to root_path
  end
end
