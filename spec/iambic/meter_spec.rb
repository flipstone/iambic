require 'spec_helper'

module Iambic
  describe Meter do
    describe 'violations' do
      it 'finds violating word on multiple lines' do
        work = Work.parse <<-end_speech.strip
          To be, or not to be, that is the question:
          Whether 'tis Nobler in the mind to suffer
        end_speech

        violations = iambic_pentameter.violations work, lexicon

        violations.map(&:word).map(&:word).should == [
          Word.new('question'), Word.new('whether')
        ]
      end

      it 'includes line that word came from' do
        work = Work.parse <<-end_speech.strip
          To be, or not to be, that is the question:
        end_speech

        violations = iambic_pentameter.violations work, lexicon
        violations.map(&:line).should == lexicon.lex(work).lines
      end

      it 'omits lines without violations' do
        work = Work.parse <<-end_speech.strip
          To be, or not to be, that is to be
        end_speech

        violations = iambic_pentameter.violations work, lexicon
        violations.should be_empty
      end

      let(:iambic_pentameter) do
        Meter.new StressPattern.new [L,H]*5
      end

      let(:lexicon) do
        Lexicon.new dictionary
      end

      let(:dictionary) do
        Dictionary.new <<-end_dict
BE 1
IS 1
IN 1
MIND 1
NOBLER 10
NOT 1
OR 0
QUESTION 10
SUFFER 10
THAT 0
THE 0
TIS 0
TO 0
WHETHER 10
        end_dict
      end
    end
  end
end
