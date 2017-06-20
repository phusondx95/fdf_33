module CategoriesHelper
	
  def load_main_category
    @main_categories = Category.main_categories
  end
end
