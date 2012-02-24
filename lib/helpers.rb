module Katas

  module Helpers

    def strip_all(hash)
      hash.update(hash) { |key, value| value.strip }
    end

  end


end
