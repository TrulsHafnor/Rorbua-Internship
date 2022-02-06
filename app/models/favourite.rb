class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates_uniqueness_of :user, scope: :story
end

