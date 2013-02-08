module Iambic
  class Stress
    class <<self
      private :new
    end

    def initialize(description)
      @description = description
    end

    def to_s
      @description
    end

    L = LOW = new('L')
    H = HIGH = new('H')
  end
end
