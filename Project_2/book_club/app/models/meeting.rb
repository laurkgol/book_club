class Meeting < ApplicationRecord
  belongs_to :club
  has_many :books
  belongs_to :user

end
