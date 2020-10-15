require 'minitest/autorun'
require 'minitest/pride'
require './lib/team.rb'
require './lib/player.rb'
require './lib/world_cup.rb'
require 'pry'
class WorldCupTest < Minitest::Test
  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@pogba)
    @france.add_player(@mbappe)
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists_and_has_attrs
    assert_instance_of WorldCup, @world_cup
    assert_equal [@france, @croatia], @world_cup.teams
    assert_equal 2018, @world_cup.year
  end

  def test_it_can_give_active_players
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
    @croatia.eliminated = true
    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end

  def test_it_can_give_players_by_position
    result = {"forward" => [@mbappe], "midfielder" => [@pogba, @modric], "defender" => [@vida]}
    assert_equal result, @world_cup.all_players_by_position
  end
end
