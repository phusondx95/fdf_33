class SuggestsController < ApplicationController
  before_action :load_suggest, only: :destroy

  def index
    @suggests = Suggest.paginate page: params[:page], per_page: Settings.suggest_limit
  end

  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = current_user.suggest.build suggest_params
    if @suggest.save
      flash[:success] = t "suggests_controller.create"
      redirect_to suggests_path
    else
      render :new
    end
  end

  def destroy
    if @suggest.destroy
      flash[:success] = t "suggests_controller.delete"
      redirect_to suggests_path
    else
      flash[:danger] = t "suggests_controller.fail"
      render :index
    end
  end

  private

  def suggest_params
    params.require(:suggest).permit :title, :description, :image, :price, :suggest_url
  end

  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
    return if @suggest
    flash[:danger] = t "suggests_controller.notfound"
    redirect_to root_url
  end
end
