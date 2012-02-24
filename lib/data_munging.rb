module Katas
  module DataMunging
    class DataReader
      include Katas::Helpers

      def read_data(path, data_extractor)
        IO.readlines(path).map { |line| strip_all data_extractor.call line.split(' ') }
      end
    end

    class DataAnalyzer
      def initialize(data)
        @data = data
      end

      def lowest_delta
        labels_and_deltas = @data.map { |item| {label: item[:label], delta: (item[:max].to_i - item[:min].to_i).abs} }
        labels_and_deltas.min { |a, b| a[:delta] <=> b[:delta] }
      end
    end

    module Weather
      class DataReader < Katas::DataMunging::DataReader
        def read_data(path)
          super path, lambda { |data| {label: data[0], max: data[1], min: data[2]} }
        end
      end
    end

    module Football
      class DataReader < Katas::DataMunging::DataReader
        def read_data(path)
          super path, lambda { |item| {label: item[1], max: item[6], min: item[8]} }
        end
      end
    end
  end
end