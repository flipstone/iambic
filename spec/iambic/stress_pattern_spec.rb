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

    describe "find_violator" do
      IAMBIC_TRIAMETER = StressPattern.new [L,H,L,H,L,H]
      IAMB = StressPattern.new([L,H])
      TROCHEE = StressPattern.new([H,L])

      it "is first pattern if it doesn't match" do
        v = IAMBIC_TRIAMETER.find_violator([TROCHEE, IAMB])
        v.should == TROCHEE
      end

      it "is second pattern if first matches and next does not" do
        v = IAMBIC_TRIAMETER.find_violator([IAMB, TROCHEE])
        v.should == TROCHEE
      end

      it "is pattern at end if match pattern runs out" do
        v = IAMBIC_TRIAMETER.find_violator([IAMB, IAMB, IAMB, IAMB])
        v.should == IAMB
      end

      it "is nil not enough patterns" do
        IAMBIC_TRIAMETER.find_violator([]).should be_nil
      end

      it "will convert objects to patterns if necessary" do
        wrapped_trochee = stub to_stress_pattern: TROCHEE
        v = IAMBIC_TRIAMETER.find_violator([wrapped_trochee])
        v.should == wrapped_trochee
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
