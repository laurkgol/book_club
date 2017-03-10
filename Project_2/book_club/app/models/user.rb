class User < ApplicationRecord
  # Good use of devise here for setting up your User model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :books
  has_many :clubs
  has_many :meetings
  has_many :members
  # Does a user have many members? Or does a user have many clubs that,
  # in turn, have many members?
end
