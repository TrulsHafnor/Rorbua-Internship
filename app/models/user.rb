class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stories

  validates :first_name, :last_name, :username, :birthday, presence: true
  validate :validate_age
  validates :username, uniqueness: true

  private

  def validate_age
    if birthday.present? && birthday.to_date > 18.years.ago.to_date
      errors.add(:birthday, 'You must be 18 years old.')
    end
  end

end
