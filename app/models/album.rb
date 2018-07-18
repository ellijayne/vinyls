# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :text
#  artist_id  :integer
#  date       :date
#  tracks     :text
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  include PgSearch
  pg_search_scope :search, against: [:title]

  belongs_to :artist, :optional => true
  has_many :pressings
  has_and_belongs_to_many :users

end
