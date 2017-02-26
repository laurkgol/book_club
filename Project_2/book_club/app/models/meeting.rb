class Meeting < ApplicationRecord
  belongs_to :club
  has_many :members 
  has_many :books
end
