require 'minitest/autorun'
require 'minitest/pride'
require_relative 'jungle_beat'
require_relative 'list'

class ListTest < MiniTest::Test
  def test_list_knows_head
    n1 = Node.new("la")
    n2 = Node.new("na")
    n1.next_node = n2
    list = List.new(n1)
    assert_equal n1, list.head
  end

  def test_appends_new_nodes_to_end_of_list
    n1 = Node.new("la")
    n2 = Node.new("na")
    @head = n1
    n1.next_node = n2
    list = List.new(n1)
    list.append("na la")
    assert_equal "la na na la", list.all
  end

  def test_appends_if_the_list_is_empty
    list = List.new(nil)
    list.append("bop")
    assert_equal "bop", list.all
  end

  def test_lists_all_data
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    @head = n1
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal "leep teep bop", list.all
  end

  def test_counts_all_nodes_in_list
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    @head = n1
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal 3, list.count
  end

  def test_count_is_zero_when_list_is_empty
    @head = nil
    list = List.new()
    assert_equal 0, list.count
  end

  def test_pop_removes_last_element_in_list
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n4 = Node.new("jeep")
    @head = n1
    n1.next_node = n2
    n2.next_node = n3
    n3.next_node = n4
    list = List.new(n1)
    list.pop
    assert_equal "leep teep bop", list.all
  end

  def test_pop_removes_head_if_list_has_only_one_item
    n1 = Node.new("leep")
    @head = n1
    list = List.new(n1)
    list.pop
    assert_equal 0, list.count
  end

  def test_prepend_adds_elements_to_beginning_of_list
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    list.prepend("bop boop")
    assert_equal "bop boop leep teep bop", list.all
  end

  def test_include_returns_true_when_element_is_in_list
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal true, list.include?("bop")
  end

  def test_include_returns_false_when_element_is_not_in_list
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal false, list.include?("Mississippi")
  end

  def test_inserts_new_node_at_identified_location
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    list.insert(1, "la na")
    assert_equal "leep la na teep bop", list.all
  end

  def test_find_finds_requested_elements
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n4 = Node.new("la")
    n5 = Node.new("na")
    n1.next_node = n2
    n2.next_node = n3
    n3.next_node = n4
    n4.next_node = n5
    list = List.new(n1)
    assert_equal "teep bop", list.find(1, 2)
  end

  def test_returns_error_if_finding_element_beyond_scope
    n1 = Node.new("leep")
    n2 = Node.new("teep")
    n3 = Node.new("bop")
    n1.next_node = n2
    n2.next_node = n3
    list = List.new(n1)
    assert_equal "Sorry, that is beyond the scope of the list.", list.find(4,1)
  end

end
