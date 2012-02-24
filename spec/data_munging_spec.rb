require 'spec_helper'

describe "Data munging kata" do

  describe "DataAnalyzer" do

    it "should return the lowest delta" do
      data = [
          {label: 'Arsenal', max: 79, min: 36},
          {label: 'Liverpool', max: 67, min: 30},
          {label: 'Manchester_U', max: 87, min: 45}
      ]
      analyzer = Katas::DataMunging::DataAnalyzer.new data
      analyzer.lowest_delta.should == {label: 'Liverpool', delta: 37}
    end

    it "should return nil for empty data" do
      analyzer = Katas::DataMunging::DataAnalyzer.new({})
      analyzer.lowest_delta.should be_nil
    end


  end

  context "Football" do

    describe "DataReader" do

      let(:reader) { Katas::DataMunging::Football::DataReader.new }

      it "should read the football.dat file" do
        data = reader.read_data('data/football.dat')
        data.should have(20).items
        data[4].should == {label: 'Leeds', max: '53', min: '37'}
      end

    end

    it "should return the name of the team with the smallest difference in 'for' and 'against' goals" do
      reader = Katas::DataMunging::Football::DataReader.new
      data = reader.read_data 'data/football.dat'
      analyzer = Katas::DataMunging::DataAnalyzer.new data
      analyzer.lowest_delta.should == {label: 'Aston_Villa', delta: 1}
    end

  end

  context "Weather" do

    describe "DataReader" do

      let(:reader) { Katas::DataMunging::Weather::DataReader.new }

      it "should read the weather.dat file" do
        data = reader.read_data('data/weather.dat')
        data.should have(30).items
        data[4].should == {label: '5', max: '90', min: '66'}
      end

    end

    it "should output the day number with the smallest temperature spread from weather.dat" do
      reader = Katas::DataMunging::Weather::DataReader.new
      data = reader.read_data 'data/weather.dat'
      analyzer = Katas::DataMunging::DataAnalyzer.new data
      analyzer.lowest_delta.should == {label: '14', delta: 2}
    end

  end

end
