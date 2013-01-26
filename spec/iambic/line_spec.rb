require 'spec_helper'

module Iambic
  describe Line do
    describe "parse_lines" do
      it "parses each line into words" do
        lines = Line.parse_lines <<-end_lines
          O Romeo, Romeo! wherefore art thou Romeo?
          Deny thy father and refuse thy name;
          Or, if thou wilt not, be but sworn my love,
          And I'll no longer be a Capulet.
        end_lines

        lines.should == [
          Line.new(Word[*%W(O Romeo Romeo wherefore art thou Romeo)]),
          Line.new(Word[*%W(Deny thy father and refuse thy name)]),
          Line.new(Word[*%W(Or if thou wilt not be but sworn my love)]),
          Line.new(Word[*%W(And I'll no longer be a Capulet)]),
        ]
      end
    end

    describe "==" do
      it { Line.new([1]).should == Line.new([1]) }
      it { Line.new([1]).should_not == Line.new([2]) }
      it { Line.new([1]).should_not == nil }
    end
  end
end
