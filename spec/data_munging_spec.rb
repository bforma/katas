require 'spec_helper'

describe "Data munging" do

  context "Football" do

    describe "DataAnalyzer" do

      it "should return the name of the team with the smallest difference in 'for' and 'against' goals" do
        data = [
            {team: 'Arsenal', goals_for: 79, goals_against: 36},
            {team: 'Liverpool', goals_for: 67, goals_against: 30},
            {team: 'Manchester_U', goals_for: 87, goals_against: 45}
        ]
        analyzer = Katas::DataMunging::Football::DataAnalyzer.new data
        analyzer.team_with_lowest_goal_balance.should == 'Liverpool'
      end

    end

    describe "DataReader" do

      let(:reader) { Katas::DataMunging::Football::DataReader.new }

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
      reader = Katas::DataMunging::Football::DataReader.new
      data = reader.read_data 'data/football.dat'
      analyzer = Katas::DataMunging::Football::DataAnalyzer.new data
      analyzer.team_with_lowest_goal_balance.should == 'Aston_Villa'
    end

  end

  context "Weather" do

    describe "DataAnalyzer" do

      it "should return the day number with the smallest temperature spread" do
        data = [
            {day: 1, max_temp: 88, min_temp: 59},
            {day: 2, max_temp: 79, min_temp: 63},
            {day: 3, max_temp: 77, min_temp: 55}
        ]
        analyzer = Katas::DataMunging::Weather::DataAnalyzer.new data
        analyzer.day_with_smallest_temperature_spread.should == 2
      end

    end

    describe "DataReader" do

      let(:reader) { Katas::DataMunging::Weather::DataReader.new }

      it "should read an empty file" do
        reader.read_data('data/empty.dat').should be_empty
      end

      it "should read a multi-line weather.dat file" do
        data = reader.read_data('data/weather.dat')
        data.should have(30).items
        data[4].should == {day: "5", max_temp: "90", min_temp: "66"}
      end

    end

    it "should output the day number with the smallest temperature spread from weather.dat" do
      reader = Katas::DataMunging::Weather::DataReader.new
      data = reader.read_data 'data/weather.dat'
      analyzer = Katas::DataMunging::Weather::DataAnalyzer.new data
      analyzer.day_with_smallest_temperature_spread.should == 14
    end

  end

end
