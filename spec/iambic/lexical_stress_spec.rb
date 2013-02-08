require 'spec_helper'

module Iambic
  describe LexicalStress do
    it 'enumerates the stresses' do
      ls = LexicalStress.new([L,H,L], Word.new('foo'))
      ls.to_a.should == [L,H,L]
    end
  end
end
