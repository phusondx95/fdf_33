class Category < ApplicationRecord
  has_and_belongs_to_many :products
  validates :name, presence: true, uniqueness: true, length: {maximum: setting 50}
end
