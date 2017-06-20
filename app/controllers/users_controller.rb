class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :verify_admin, only: :destroy
  
  def index
    @users = User.order_by_id.paginate page: params[:page], per_page: Settings.user_limit
  end
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "users_controller.welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users_controller.updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users_controller.des"
      redirect_to users_url
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "users_controller.not_found"
    redirect_to users_path
  end
end
