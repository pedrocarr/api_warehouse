class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'must be a valid email address' }
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :requests
end
