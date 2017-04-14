require 'import'

module Base
  class SplitArrayToHalf
    def call(offset:, limit:)
      array = (offset..(offset + limit - 1)).to_a
      array.each_slice((array.size / 2.0).round).to_a
    end
  end
end
