# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :text
#  email      :text
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  #password
  #validations
  has_secure_password
  validates :username, :presence => true, :uniqueness=> true #user can only have account if they pick user name and it can't be a user name already in use.
  validates :email, :presence => true, :uniqueness => true #user can only have account if they enter an email address AND it is not already an email address in the DB

  #associations
  has_many :albums
  has_and_belongs_to_many :artists #need HABTM here because you have the joiner table even though users dont really belong to anyone
  # has_and_belongs_to_many :albums

end
