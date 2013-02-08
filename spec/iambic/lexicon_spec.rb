require 'spec_helper'

module Iambic
  describe Lexicon do
    subject do
      Lexicon.new 'FOO' => ['F UW1'],
                  'BAR' => ['B AA1 R'],
                  'BAZ' => ['B AE1 Z', 'B AE0 Z'],
                  'NONE' => []
    end

    describe "[]" do
      it "looks up lexical items for words" do
        bar = Word.new 'bar'
        subject[bar].should == [lexical_item('bar','B AA1 R')]
      end

      it "handles multiple results" do
        baz = Word.new 'baz'
        item_1 = lexical_item 'baz', 'B AE1 Z'
        item_2 = lexical_item 'baz', 'B AE0 Z'

        subject[baz].should == [item_1, item_2]
      end
    end

    describe "lex" do
      it "looks up lexical items for phrases" do
        lexed = subject.lex [Word.new('foo'), Word.new('bar')]
        lexed.should == [lexical_item('foo','F UW1'),
                         lexical_item('bar','B AA1 R')]
      end

      it "puts in a missing item when nothing found" do
        lexed = subject.lex [Word.new('none')]
        lexed.should == [Lexicon::Missing.new(Word.new('none'))]
      end
    end

    def lexical_item(word, pronounciaton)
      LexicalItem.new Word.new(word), Pronounciation.new(pronounciaton)
    end
  end
end
