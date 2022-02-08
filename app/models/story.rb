class Story < ApplicationRecord
  has_one_attached :story_file
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :likes
  has_many :dislikes

  validates :title, :description, presence: true
  validates :story_file, presence: true, blob:{ content_type: :audio } #For flere validations: https://github.com/aki77/activestorage-validator

  def getFavourite(current_user)
    @favourite = Favourite.where(user_id: current_user.id, story_id: self.id).first
  end

  def isFavourite(current_user)
    @favourite = Favourite.where(user_id: current_user.id, story_id: self.id).first
    if @favourite then return true end
    return false
  end

end
