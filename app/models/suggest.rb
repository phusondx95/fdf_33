class Suggest < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: setting 50}
  validates :description, presence: true, length: {maximum: setting 140}
  default_scope -> {order(created_at: :desc)}
end
