class List < ApplicationRecord
  has_many :positions , -> { order(position: :asc) }
  has_many :items, through: :positions

  def add(item)
    reload
    max_pos = positions.maximum("position") || -1
    next_pos = max_pos+1
    positions.create(position: next_pos,item: item)
  end
  def reorder(from, to)
    transaction do
      p = positions[from]
      if to < from # moving up
        for i in to..from-1
          positions[i].position = positions[i].position+1
          positions[i].save
        end
      else
        for i in from+1..to
          positions[i].position = positions[i].position-1
          positions[i].save
        end
      end
      p.position = to
      p.save
    end
  end

  def item_at(index)
    items[index]
  end

  def check_sanity
    reload
    index = 0
    positions.each do |p|
      if p.position != index
        return false
      end
      index += 1
    end
  end

end
