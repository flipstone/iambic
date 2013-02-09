require 'spec_helper'

module Iambic
  describe Sample do
    it 'should find an available sample' do
      s = Sample.find('to_be_or_not_to_be')
      s.text.should =~ /Whether 'tis Nobler/
    end

    it 'raises an error if unknown sample name is given' do
      -> do
        Sample.find('unknown_sample')
      end.should raise_error Sample::SampleNotFoundError
    end
  end
end
