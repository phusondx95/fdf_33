class CategoriesController < ApplicationController
  before_action :load_category, except: [:index, :new, :create]

  def show
    @subcategory = @category.subcategories.paginate page: params[:page],
      per_page: Settings.category_limit
  end

  def new
    @subcategory = Category.new
  end

  def create
    @subcategory = Category.new subcategory_params
    if @subcategory.parent_id == nil
      flash[:danger] = t "categories_controller.danger"
      redirect_to new_category_path
    else
      if @subcategory.save
        flash[:success] = t "categories_controller.success"
        redirect_to category_path @subcategory.parent_id
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @category.update_attributes subcategory_params
      @subcategory = Category.new subcategory_params
      flash[:success] = t "categories_controller.updated"
      redirect_to category_path @subcategory.parent_id
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "categories_controller.delete"
      redirect_back fallback_location: root_path
    else
      flash[:danger] = t "categories_controller.fail_delete"
      render :show
    end
  end

  private

  def subcategory_params
    params.require(:category).permit :name, :parent_id
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "categories_controller.notfound"
    redirect_to root_url
  end
end
