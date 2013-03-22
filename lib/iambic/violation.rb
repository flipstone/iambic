module Iambic
  Violation = Struct.new :word, :line do
    def string
      word.string
    end
  end
end
