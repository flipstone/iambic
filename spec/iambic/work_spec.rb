require 'spec_helper'

module Iambic
  describe Work do
    describe "parse" do
      it "parses lines" do
        work = Work.parse <<-end_lines
          O Romeo, Romeo! wherefore art thou Romeo?
          Deny thy father and refuse thy name;
          Or, if thou wilt not, be but sworn my love,
          And I'll no longer be a Capulet.
        end_lines

        work.should == Work.new([
          Line.new(Word[*%W(O Romeo Romeo wherefore art thou Romeo)]),
          Line.new(Word[*%W(Deny thy father and refuse thy name)]),
          Line.new(Word[*%W(Or if thou wilt not be but sworn my love)]),
          Line.new(Word[*%W(And I'll no longer be a Capulet)]),
        ])
      end
    end

    describe "map" do
      it "allows youto map the words (not lines!)" do
        work = Work.new [Line.new(Word[*%W[1 2]]),
                         Line.new(Word[*%W[3 4]])]

        expected = Work.new [Line.new([1,2]), Line.new([3,4])]

        work.map { |w| w.string.to_i }.should == expected
      end
    end

    describe "==" do
      it { Work.new([1]).should == Work.new([1]) }
      it { Work.new([1]).should_not == Work.new([2]) }
      it { Work.new([1]).should_not == nil }
    end
  end
end
