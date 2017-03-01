class Meeting < ApplicationRecord
  belongs_to :club
  has_many :books
  belongs_to :member
  belongs_to :user

end
