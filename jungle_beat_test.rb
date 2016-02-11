require 'minitest/autorun'
require 'minitest/pride'
require_relative 'jungle_beat'


class JungleBeatTest < MiniTest::Test

    def test_it_appends
    jb = JungleBeat.new("deep dep")
    jb.append("deep bop bop deep")
    assert_equal "deep dep deep bop bop deep", jb.all
  end

  def test_append_returns_the_number_of_beats_appended
    n1 = Node.new("deep")
    n2 = Node.new("dep")
    @head = n1
    n1.next_node = n2
    list = List.new(n1)
    jb = JungleBeat.new("deep dep")
    assert_equal 2, jb.append("boop bop")
  end

  def test_all
    jb = JungleBeat.new("boop bop bop boop")
    assert_equal "boop bop bop boop", jb.all
  end

  def test_prepend_adds_elements_to_beginning_of_list
    jb = JungleBeat.new("beep deep doop beep")
    jb.prepend("la na la da")
    assert_equal "la na la da beep deep doop beep", jb.all
  end

  def test_prepend_returns_the_number_of_prepended_beats
    n1 = Node.new("leep")
    n2 = Node.new("deep")
    @head = n1
    n1.next_node = n2
    list = List.new(n1)
    jb = JungleBeat.new("boop bop")
    assert_equal 2, jb.prepend("dop pop")
  end

  def test_include_requested_elements
    jb = JungleBeat.new("la da beep deep")
    assert jb.include?("beep")
  end

  def test_it_does_not_include_requested_elements
    jb = JungleBeat.new("la da beep deep")
    refute jb.include?("Mississippi")
  end

  def test_pop_removes_last_elements_in_a_list
    jb = JungleBeat.new("la da beep deep")
    jb.pop(1)
    assert_equal "la da beep", jb.all
  end

  def test_pop_returns_beats_that_were_popped
    jb = JungleBeat.new("la da beep deep")
    assert_equal "beep deep", jb.pop(2)
  end

  def test_pop_can_remove_more_than_one_beat
    jb = JungleBeat.new("la da beep deep")
    jb.pop(2)
    assert_equal "la da", jb.all
  end

  def test_count_all_beats
    jb = JungleBeat.new("la da beep deep")
    assert_equal 4, jb.count
  end

  def test_it_inserts_new_nodes_at_identified_location
    jb = JungleBeat.new("la da beep deep")
    jb.insert(1, "bop boop")
    assert_equal "la bop boop da beep deep", jb.all
  end

  def test_it_returns_error_if_beyond_scope
    jb = JungleBeat.new("la da beep deep")
    assert_equal "Sorry, that is beyond the scope of the list.", jb.insert(5, "tee")
  end

  def test_insert_returns_all_beats
    jb = JungleBeat.new("la da beep deep")
    assert_equal "la bop boop da beep deep", jb.insert(1, "bop boop")
  end

  def test_find_finds_number_of_beats_at_identified_location
    jb = JungleBeat.new("la bop boop da beep deep")
    assert_equal "bop", jb.find(1, 1)
  end

  def test_play_returns_number_of_beats_played
    jb = JungleBeat.new("la bop boop da beep deep")
    assert_equal 6, jb.play
  end


end
