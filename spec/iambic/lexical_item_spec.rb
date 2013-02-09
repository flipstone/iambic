require 'spec_helper'

module Iambic
  describe LexicalItem do
    describe "to_s" do
      let(:item) do
        LexicalItem.new Word.new('foo'),
                        Pronounciation.new('F UW1')
      end

      it "includes word" do
        item.to_s.should =~ /FOO/
      end

      it "includes pronounciation" do
        item.to_s.should =~ /F UW1/
      end
    end

    describe "==" do
      it "is true if word and pronounciation are the same" do
        li_1 = LexicalItem.new Word.new('foo'),
                               Pronounciation.new('FOO1')
        li_2 = LexicalItem.new Word.new('foo'),
                               Pronounciation.new('FOO1')

        li_1.should == li_2
      end

      it "is false if word is different" do
        li_1 = LexicalItem.new Word.new('foo'),
                               Pronounciation.new('FOO1')
        li_2 = LexicalItem.new Word.new('fou'),
                               Pronounciation.new('FOO1')

        li_1.should_not == li_2
      end

      it "is false if prounciation is different" do
        li_1 = LexicalItem.new Word.new('foo'),
                               Pronounciation.new('FOO1')
        li_2 = LexicalItem.new Word.new('foo'),
                               Pronounciation.new('FOO0')

        li_1.should_not == li_2
      end

      it { LexicalItem.new(Word.new(''), Pronounciation.new('')).should_not == nil }
    end
  end
end
