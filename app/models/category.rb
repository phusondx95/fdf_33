class Category < ApplicationRecord
  has_many :products
  has_many :subcategories, class_name: Category.name, foreign_key: :parent_id
  belongs_to :fooddrinks, class_name: Category.name, optional: true
  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.max_name}
  scope :main_categories, -> {where(parent_id: nil)}
  scope :sub_category, -> {where.not(parent_id: nil)}
end
