class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  validates :user_id, presence: true
  validates :full_name, :email, :address, :pay_type, presence: true
end
