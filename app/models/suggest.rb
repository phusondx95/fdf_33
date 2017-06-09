class Suggest < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {maximum:Settings.max_title}
  validates :description, presence: true, length: {maximum: Settings.max_description}
  validates :user_id, presence: true
  scope -> {order(created_at: :desc)}
end
