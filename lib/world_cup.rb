class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_teams.map do |team|
      team.players.find_all do |player|
        player.position == position
      end
    end.flatten
  end

  def active_teams
    teams.find_all do |team|
      team.eliminated? == false
    end
  end

  def all_players_by_position
    result = {}
    teams.each do |team|
      team.players.each do |player|
        if result[player.position]
          result[player.position] << player
        else
          result[player.position] = [player]
        end
      end
    end
    result
  end
end
