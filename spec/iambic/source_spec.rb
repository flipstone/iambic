require 'spec_helper'

module Iambic
  describe Source do
    describe "to_s" do
      it "is the string" do
        Source.new("foo").to_s.should == "foo"
      end
    end

    describe "each_line" do
      it "is iterator over string lines" do
        Source.new("a\nb\nc").each_line.map(&:to_s).should ==
          "a\nb\nc".each_line.to_a
      end

      it "increments line_number" do
        lines = Source.new("a\nb\nc", 2).each_line
        lines.map(&:line_number).should == [2,3,4]
      end
    end

    describe "split" do
      it "splits by pattern" do
        Source.new("a,b,c").split(',').map(&:to_s).should ==
          %w(a b c)
      end

      it "maintains line number" do
        items = Source.new("a,b,c", 2).split(',')
        items.map(&:line_number).should == [2,2,2]
      end
    end

    describe "line_number" do
      it "is initially 1" do
        Source.new("a\nb\nc").line_number.should == 1
      end
    end

    describe "upcase" do
      it "upcases the string" do
        Source.new('a', 2).upcase == Source.new('A', 2)
      end
    end

    describe "==" do
      it { Source.new('a', 2).should == Source.new('a', 2) }
      it { Source.new('a', 2).should_not == Source.new('A', 2) }
      it { Source.new('a', 2).should_not == Source.new('a', 1) }
      it { Source.new('a', 2).should_not == nil }
    end
  end
end
