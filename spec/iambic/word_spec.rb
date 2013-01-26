require 'spec_helper'

module Iambic
  describe Iambic::Word do
    describe "new" do
      it "uppercases the word" do
        Word.new('foo').should == Word.new('FOO')
      end
    end
    describe "[]" do
      it "creates a word array" do
        Word['FOO','BAR','BAZ'].should == [
          Word.new('FOO'), Word.new('BAR'), Word.new('BAZ')
        ]
      end
    end

    describe "parse_words" do
      it "splits words on spaces" do
        Word.parse_words('FOO BAR  BAZ').should == Word['FOO','BAR','BAZ']
      end

      it "splits words on punctioation" do
        Word.parse_words('A.B?!C:D;E-F').should == Word[*%W(A B C D E F)]
      end

      it "maintains apostrophes in words" do
        Word.parse_words("FOO'S BAR'S").should == Word["FOO'S","BAR'S"]
      end

      it "maintains numeric strings" do
        Word.parse_words('1 2 3 4 5 6 7 8 9 10').should == Word[*%W(1 2 3 4 5 6 7 8 9 10)]
      end

      it "ignores leading and trailing whitespace" do
        Word.parse_words('  FOO  ').should == Word['FOO']
      end
    end

    describe "==" do
      it { Word.new('FOO').should == Word.new('FOO') }
      it { Word.new('FOO').should_not == Word.new('BAR') }
      it { Word.new('FOO').should_not == nil }
    end
  end
end

