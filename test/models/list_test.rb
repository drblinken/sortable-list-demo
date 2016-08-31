require 'test_helper'

class ListTest < ActiveSupport::TestCase
  setup do
    @list = lists(:reorder_list)
  end

  test "fixture setup" do
    assert_equal 4, @list.items.size
  end

  test "assert initial order" do
    assert_order [:item_1,:item_2,:item_3,:item_4]
  end

  test "reorder up" do
    @list.reorder(3,0)
    assert_order [:item_4,:item_1,:item_2,:item_3]
    assert @list.check_sanity, "positions have been messed up: #{@list.positions.map(&:position)}"
  end
  test "reorder down" do
    @list.reorder(0,3)
    assert_order [:item_2,:item_3,:item_4,:item_1]
    assert @list.check_sanity, "positions have been messed up: #{@list.positions.map(&:position)}"
  end
  test "reorder up by one" do
    @list.reorder(2,1)
    assert_order [:item_1,:item_3,:item_2,:item_4]
    assert @list.check_sanity, "positions have been messed up: #{@list.positions.map(&:position)}"
  end
  test "reorder down by one" do
    @list.reorder(0,1)
    assert_order [:item_2,:item_1,:item_3,:item_4]
    assert @list.check_sanity, "positions have been messed up: #{@list.positions.map(&:position)}"
  end

  def assert_order(a)
    (0..a.size-1).to_a.zip(a).each do | index, item |
       assert_equal items(item), @list.item_at(index),
      "position #{index} doesn't match; expected: #{a} but was: #{@list.items.map(&:label)}"
    end
  end

end
