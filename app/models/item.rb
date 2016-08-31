class Item < ApplicationRecord
  #has_one :position
  has_many :positions
  has_many :lists, through: :positions
end
