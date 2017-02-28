class Book < ApplicationRecord
  belongs_to :meeting
  has_many :reviews
  belongs_to :user
end
