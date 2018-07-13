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
  has_many :albums, :optional => true
  #didnt put HABTM here cos it doesnt belong to artists as all?? but do i need connection? 
end
