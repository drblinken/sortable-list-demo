class List < ApplicationRecord
  has_many :positions , -> { order "position ASC" }
  has_many :items, through: :positions
end
