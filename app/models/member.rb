class Member < ApplicationRecord
  belongs_to :club
  belongs_to :user, optional: true

end
