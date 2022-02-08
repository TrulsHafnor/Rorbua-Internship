class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stories
  has_many :favourites, dependent: :destroy
  has_many :likes
  has_many :dislikes

  validates :username, presence: true
  validates :username, uniqueness: true
end
