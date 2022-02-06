class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stories
  has_many :favourites, dependent: :destroy

  validates :first_name, :last_name, :username, :birthday, presence: true
  validate :validate_age
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: 'cannot contain whitespace' }

  private

  def validate_age
    if birthday.present? && birthday.to_date > 18.years.ago.to_date
      errors.add(:birthday, 'You must be 18 years old.')
    end
  end

end
