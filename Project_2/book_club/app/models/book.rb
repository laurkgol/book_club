class Book < ApplicationRecord
  has_many :reviews
  belongs_to :meetings, optional: true
  belongs_to :user
end
