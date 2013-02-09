require 'spec_helper'

module Iambic
  describe Dictionary do
    describe "[]" do
      it "looks up stress for a word" do
        d = Dictionary.new "TIZZY  T IH1 Z IY0"
        d["TIZZY"].should == ["T IH1 Z IY0"]
      end

      it "looks up one character words" do
        d = Dictionary.new <<-end_src
A  AH0
A(1)  EY1
        end_src

        d['A'].should == ['AH0', 'EY1']
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

      it "will accept a plural when word is possessive" do
        d = Dictionary.new <<-end_src
OPPRESSORS  AH0 P R EH1 S ER0 Z
        end_src

        d["OPPRESSOR'S"].should == ["AH0 P R EH1 S ER0 Z"]
      end

      it "will accept a possessive when word is plural" do
        d = Dictionary.new <<-end_src
OPPRESSOR'S  AH0 P R EH1 S ER0 Z
        end_src

        d["OPPRESSORS"].should == ["AH0 P R EH1 S ER0 Z"]
      end

      it "ignores commented lines" do
        d = Dictionary.new <<-end_src
#TIVOLI  T IH1 V AH0 L IY0
        end_src

        d['TIVOLI'].should == []
      end
    end

    describe "fuzz test" do
      it("works") { 100.times { fuzz } }

      def fuzz
        words = 10.times.map { rand_word }.sort
        dictionary = words.map { |w| "#{w} #{w}" }.join("\n")

        words.each do |word|
          dictionary[word].should == word
        end
      end

      def rand_word
        rand(1..10).times.map { rand_letter }.join('')
      end

      def rand_letter
        letters.shuffle.first
      end

      let(:letters) { ('A'..'Z').to_a }
    end
  end
end

