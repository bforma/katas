require 'spec_helper'

describe Katas::Weather do

  describe Katas::Weather::DataAnalyzer do

    it "should return the day number with the smallest temperature spread" do
      data = [
          {day: 1, max_temp: 88, min_temp: 59},
          {day: 2, max_temp: 79, min_temp: 63},
          {day: 3, max_temp: 77, min_temp: 55}
      ]
      analyzer = Katas::Weather::DataAnalyzer.new data
      analyzer.day_with_smallest_temperature_spread.should == 2
    end

  end

  describe Katas::Weather::DataReader do

    let(:reader) { Katas::Weather::DataReader.new }

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
    reader = Katas::Weather::DataReader.new
    data = reader.read_data 'data/weather.dat'
    analyzer = Katas::Weather::DataAnalyzer.new data
    analyzer.day_with_smallest_temperature_spread.should == 14
  end

end