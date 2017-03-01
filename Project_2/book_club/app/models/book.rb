class Book < ApplicationRecord
  has_many :reviews
  belongs_to :meetings
  belongs_to :user
end
