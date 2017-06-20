class Product < ApplicationRecord
  has_many :line_items
  belongs_to :categories, optional: true
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: {maximum: Settings.max_title}
  validates :description, length: {maximum: Settings.max_description}
  validates :price, numericality: {greater_than_or_equal_to: Settings.min_price}
  validates :image_url, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: I18n.t("products.image")
  }
end
