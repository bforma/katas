require 'data_munging/common'

module Katas
  module Football

    class DataAnalyzer

      def initialize(data)
        @data = data
      end

      def team_with_lowest_goal_balance
        goal_balances = @data.map {|data| {team: data[:team], goal_balance: (data[:goals_for].to_i - data[:goals_against].to_i).abs} }
        lowest_goal_balance = goal_balances.min {|a,b| a[:goal_balance] <=> b[:goal_balance]}
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