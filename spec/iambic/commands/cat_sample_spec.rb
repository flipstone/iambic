require 'spec_helper'

module Iambic
  module Commands
    describe CatSample do
      it "prints sample" do
        args = ['to_be_or_not_to_be']
        stdin = StringIO.new ''
        stdout = StringIO.new
        CatSample.run args, stdin, stdout

        stdout.string.should == Sample.find('to_be_or_not_to_be').text
      end
    end
  end
end

