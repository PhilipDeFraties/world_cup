require 'minitest/autorun'
require 'minitest/pride'
require './lib/team.rb'
require './lib/player.rb'
require 'pry'
class TeamTest < Minitest::Test
  def setup
    @team = Team.new("France")
  end

  def test_it_exists_and_has_attrs
    assert_equal "France", @team.country
  end

  def test_not_eliminated_by_default
    assert_equal false, @team.eliminated?
  end

  def test_can_be_eliminated
    @team.eliminated = true

    assert_equal true, @team.eliminated?
  end

  def test_has_no_players_by_default
    assert_equal [], @team.players
  end

  def test_it_can_add_players
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @team.add_player(mbappe)
    @team.add_player(pogba)

    assert_equal [mbappe, pogba], @team.players
  end

  def test_it_can_give_players_by_position
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @team.add_player(pogba)
    assert_equal [pogba], @team.players_by_position("midfielder")
  end
end
