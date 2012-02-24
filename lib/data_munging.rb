module Katas

  module DataMunging

    module Weather

      class DataAnalyzer

        def initialize(data)
          @data = data
        end

        def day_with_smallest_temperature_spread
          daily_spreads = @data.map { |data| {day: data[:day], spread: data[:max_temp].to_i - data[:min_temp].to_i} }
          minimum_day_and_spread = daily_spreads.min { |a, b| a[:spread] <=> b[:spread] }
          minimum_day_and_spread[:day].to_i if minimum_day_and_spread
        end

      end

      class DataReader
        include Katas::Helpers

        def read_data(path)
          IO.readlines(path).map do |line|
            data = line.split(' ')
            daily_data = {day: data[0], max_temp: data[1], min_temp: data[2]}
            strip_all daily_data
          end
        end

      end

    end

    module Football

      class DataAnalyzer

        def initialize(data)
          @data = data
        end

        def team_with_lowest_goal_balance
          goal_balances = @data.map { |data| {team: data[:team], goal_balance: (data[:goals_for].to_i - data[:goals_against].to_i).abs} }
          lowest_goal_balance = goal_balances.min { |a, b| a[:goal_balance] <=> b[:goal_balance] }
          lowest_goal_balance[:team] if lowest_goal_balance
        end

      end

      class DataReader
        include Katas::Helpers

        def read_data path
          IO.readlines(path).map do |line|
            data = line.split(' ')
            team_data = {team: data[1], goals_for: data[6], goals_against: data[8]}
            strip_all(team_data)
          end
        end

      end

    end

  end

end