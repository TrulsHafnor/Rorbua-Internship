class Story < ApplicationRecord
  has_one_attached :story_file
  belongs_to :user
end
