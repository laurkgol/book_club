class Book < ApplicationRecord
  has_many :reviews
  belongs_to :meetings, optional: true
  # Good use here of optional associations
  belongs_to :user
end
