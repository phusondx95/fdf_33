class Product < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_and_belongs_to_many :categories
  before_create :approve_product
  before_destroy :not_referenced_by_line_item
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: {maximum: setting 50}
  validates :description, length: {maximum: setting 150}
  validates :price, numericality: {greater_than_or_equal_to: 5000}
  validates :image_url, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: I18n.t("products.image")
  }
end
