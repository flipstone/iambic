require 'spec_helper'

module Iambic
  describe Pronounciation do
    describe "stress_pattern" do
      def self.sp(string, stress_pattern)
        it "#{string.inspect} should have pattern #{stress_pattern}" do
          pronouncation = Pronounciation.new string
          pronouncation.to_stress_pattern.should == stress_pattern
        end
      end

      sp 'T UW1', StressPattern.new([H])
      sp 'T IH0', StressPattern.new([L])
      sp 'T OW1 S T ER0', StressPattern.new([H,L])
      sp 'AE1 B D AH0 K EY2 T', StressPattern.new([H,L,L])
    end

    describe "==" do
      it { Pronounciation.new('T UW1').should == Pronounciation.new("T UW1") }
      it { Pronounciation.new('T AW1').should_not == Pronounciation.new("T UW1") }
      it { Pronounciation.new('T AW1').should_not == nil }
    end
  end
end
