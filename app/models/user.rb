class User < ApplicationRecord
  has_secure_password
  validates :nickname, :email, :password, presence: true
  has_many :posts, dependent: :destroy
end
