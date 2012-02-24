module Katas

  module Helpers

    def strip_all(data)
      data.update(data) { |key, value| value.strip }
    end

  end

end
