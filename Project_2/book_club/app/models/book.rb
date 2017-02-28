class Book < ApplicationRecord
  belongs_to :meeting
  has_many :reviews
end
