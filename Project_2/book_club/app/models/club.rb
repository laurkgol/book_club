class Club < ApplicationRecord
  has_many :meetings
  has_many :members
  has_many :books
  belongs_to :user

end
