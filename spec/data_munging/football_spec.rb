require 'spec_helper'

describe Katas::Football do

  describe Katas::Football::DataAnalyzer do

    it "should return the name of the team with the smallest difference in 'for' and 'against' goals" do
      data = [
          {team: 'Arsenal', goals_for: 79, goals_against: 36},
          {team: 'Liverpool', goals_for: 67, goals_against: 30},
          {team: 'Manchester_U', goals_for: 87, goals_against: 45}
      ]
      analyzer = Katas::Football::DataAnalyzer.new data
      analyzer.team_with_lowest_goal_balance.should == 'Liverpool'
    end

  end

  describe Katas::Football::DataReader do

    let(:reader) { Katas::Football::DataReader.new }

    it "should read an empty file" do
      reader.read_data('data/empty.dat').should be_empty
    end

    it "should read a multi-line football.dat file" do
      data = reader.read_data('data/football.dat')
      data.should have(20).items
      data[4].should == {team: 'Leeds', goals_for: '53', goals_against: '37'}
    end

  end

  it "should return the name of the team with the smallest difference in 'for' and 'against' goals" do
    reader = Katas::Football::DataReader.new
    data = reader.read_data 'data/football.dat'
    analyzer = Katas::Football::DataAnalyzer.new data
    analyzer.team_with_lowest_goal_balance.should == 'Aston_Villa'
  end

end
