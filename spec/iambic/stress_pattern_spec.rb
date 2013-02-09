require 'spec_helper'

module Iambic
  describe StressPattern do
    describe "partial_match" do
      it "returns a new StressPattern with remaining part" do
        p = StressPattern.new [L,H,H,L]
        new_p = p.partial_match StressPattern.new [L,H]
        new_p.should == StressPattern.new([H,L])
      end

      it "returns nil if given pattern is not a prefix of this pattern" do
        p = StressPattern.new [L,H,H,L]
        p.partial_match(StressPattern.new [H,L]).should be_nil
      end
    end

    describe "try_partial_matches" do
      it "returns remaining stress pattern on match" do
        p = StressPattern.new [L,H,H,L]
        new_p = p.try_partial_matches [StressPattern.new([L,H])]
        new_p.should == StressPattern.new([H,L])
      end

      it "tries all patterns" do
        p = StressPattern.new [L,H,H,L]
        new_p = p.try_partial_matches [
          StressPattern.new([H,L]),
          StressPattern.new([H,H]),
          StressPattern.new([L,H]),
        ]
        new_p.should == StressPattern.new([H,L])
      end

      it "returns nil if no pattens match" do
        p = StressPattern.new [L,H,H,L]
        new_p = p.try_partial_matches [
          StressPattern.new([H,L]), StressPattern.new([H,H])
        ]
        new_p.should be_nil
      end
    end

    describe "find_violator" do
      IAMBIC_TRIAMETER = StressPattern.new [L,H,L,H,L,H]
      IAMB = StressPattern.new([L,H])
      TROCHEE = StressPattern.new([H,L])

      it "is first pattern if it doesn't match" do
        v = IAMBIC_TRIAMETER.find_violator [word(TROCHEE),
                                            word(IAMB)]
        v.stress_patterns.should == [TROCHEE]
      end

      it "is second pattern if first matches and next does not" do
        v = IAMBIC_TRIAMETER.find_violator [word(IAMB),
                                            word(TROCHEE)]
        v.stress_patterns.should == [TROCHEE]
      end

      it "is pattern at end if match pattern runs out" do
        v = IAMBIC_TRIAMETER.find_violator [word(IAMB),
                                            word(IAMB),
                                            word(IAMB),
                                            word(IAMB)]
        v.stress_patterns.should == [IAMB]
      end

      it "is nil if patten matchers" do
        v = IAMBIC_TRIAMETER.find_violator [word(IAMB),
                                            word(IAMB),
                                            word(IAMB)]
        v.should be_nil
      end

      it "tries all of words patterns" do
        v = IAMBIC_TRIAMETER.find_violator [word(TROCHEE, IAMB),
                                            word(IAMB),
                                            word(IAMB)]
        v.should be_nil
      end

      it "is nil not enough patterns" do
        IAMBIC_TRIAMETER.find_violator([]).should be_nil
      end

      def word(*patterns)
        stub stress_patterns: patterns
      end
    end

    describe "==" do
      it "is true if same pattern" do
        StressPattern.new([L,H,L]).should ==
          StressPattern.new([L,H,L])
      end

      it "is false if patterns differ" do
        StressPattern.new([L,H,L]).should_not ==
          StressPattern.new([L,L,L])
      end

      it { StressPattern.new([]).should_not == nil }
    end
  end
end
