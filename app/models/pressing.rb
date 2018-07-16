# == Schema Information
#
# Table name: pressings
#
#  id               :bigint(8)        not null, primary key
#  album_id         :integer
#  year             :integer
#  limited          :boolean
#  color            :text
#  weight           :string
#  gatefold         :boolean
#  remastered       :boolean
#  quantity_pressed :integer
#  virgin_vinyl     :boolean
#  lp_qty           :string
#  image            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Pressing < ApplicationRecord
  belongs_to :album, :optional => true
end
