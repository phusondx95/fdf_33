class User < ApplicationRecord
  has_many :suggest, dependent: :destroy
  has_many :order, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: Settings.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_email}, format: {with: VALID_EMAIL_REGEX}, 
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.min_password}
end
