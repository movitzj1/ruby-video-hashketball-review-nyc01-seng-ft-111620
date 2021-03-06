# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:player_name] == player_name
            return value_item[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:player_name] == player_name
            return value_item[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      return value[:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |key, value|
    team_names << value[:team_name]
  end
  return team_names
end

def player_numbers(team_name)
  empty_array = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      value.each do |inner_key, inner_value|
        if inner_key == :players
          inner_value.each do |value_item|
            empty_array << value_item[:number]
          end
        end
      end
    end
  end
  return empty_array
end

def player_stats(player_name)
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:player_name] == player_name
            return value_item
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  max = 0
  player_name = ""
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:shoe] > max
            max = value_item[:shoe]
            player_name = value_item[:player_name]
          end
        end
      end
    end
  end
  return player_stats(player_name)[:rebounds]
end

def most_points_scored
  max = 0
  player_name = ""
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:points] > max
            max = value_item[:points]
            player_name = value_item[:player_name]
          end
        end
      end
    end
  end
  return player_name
end

#puts most_points_scored

def winning_team
  max = 0
  team_name = ""
  game_hash.each do |key, value|
    total_points = 0
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          total_points += value_item[:points]
        end
      end
    end
    if total_points > max
      max = total_points
      team_name = value[:team_name]
    end
  end
  return team_name
end

#puts winning_team

def player_with_the_longest_name
  max = 0
  player_name = ""
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:player_name].length > max
            max = value_item[:player_name].length
            player_name = value_item[:player_name]
          end
        end
      end
    end
  end
  return player_name
end
#puts player_with_the_longest_name

def long_name_steals_a_ton?
  max = 0
  player_name = ""
  game_hash.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_key == :players
        inner_value.each do |value_item|
          if value_item[:steals] > max
            max = value_item[:steals]
            player_name = value_item[:player_name]
          end
        end
      end
    end
  end
  if player_with_the_longest_name == player_name
    return true
  else
    return false
  end
end

puts long_name_steals_a_ton?