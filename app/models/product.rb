class Product < ApplicationRecord
  has_many :line_items
  belongs_to :categories, optional: true
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: {maximum: Settings.max_title}
  validates :description, length: {maximum: Settings.max_description}
  validates :price, numericality: {greater_than_or_equal_to: Settings.min_price}
  mount_uploader :image_url, ImageUploader
  validate  :image_size

  scope :order_by_id, -> {order(id: :desc)}

  private

  def image_size
    if image_url.size > 5.megabytes
      errors.add :image_url, t("products.should")
    end
  end
end
