# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :text
#  email           :text
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord

  #password
  #validations
  has_secure_password
  validates :username, :presence => true, :uniqueness=> true #user can only have account if they pick user name and it can't be a user name already in use.
  validates :email, :presence => true, :uniqueness => true #user can only have account if they enter an email address AND it is not already an email address in the DB

  #associations
  has_and_belongs_to_many :albums, :before_add => :prevent_duplicate_album
  has_and_belongs_to_many :artists, :before_add => :prevent_duplicate_artist #need HABTM here because you have the joiner table even though users dont really belong to anyone
  private
  def prevent_duplicate_artist(artist)
    raise ActiveRecord::Rollback if self.artists.include?(artist)
  end
  def prevent_duplicate_album(album)
    raise ActiveRecord::Rollback if self.albums.include?(album)
  end
end
