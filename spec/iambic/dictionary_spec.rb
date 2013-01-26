require 'iambic'

module Iambic
  describe Dictionary do
    describe "[]" do
      it "looks up stress for a word" do
        d = Dictionary.new "TIZZY  T IH1 Z IY0"
        d["TIZZY"].should == ["T IH1 Z IY0"]
      end

      it "handles multiple words" do
        d = Dictionary.new <<-end_src
TIVOLI  T IH1 V AH0 L IY0
TIZZY  T IH1 Z IY0
        end_src

        d["TIVOLI"].should == ["T IH1 V AH0 L IY0"]
        d["TIZZY"].should == ["T IH1 Z IY0"]
      end

      it "handles multiple definitions for a word" do
        d = Dictionary.new <<-end_src
TO  T UW1
TO(1)  T IH0
TO(2)  T AH0
        end_src

        d["TO"].should == ["T UW1", "T IH0", "T AH0"]
      end

      it "handles words with are prefixes of other words" do
        d = Dictionary.new <<-end_src
TO  T UW1
TOW  T OW1
TOWARD  T AH0 W AO1 R D
        end_src

        d["TO"].should == ["T UW1"]
        d["TOW"].should == ["T OW1"]
      end

      it "ignores commented lines" do
        d = Dictionary.new <<-end_src
#TIVOLI  T IH1 V AH0 L IY0
        end_src

        d['TIVOLI'].should == []
      end
    end
  end
end

