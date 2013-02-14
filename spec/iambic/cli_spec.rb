require 'spec_helper'

module Iambic
  describe CLI do
    it 'defaults to find violations' do
      args = [[], mock(:stdin), mock(:stdout)]
      Commands::FindViolations.should_receive(:run).with(*args)
      CLI.run *args
    end

    it 'invokes CatSample for sample' do
      inout = [mock(:stdin), mock(:stdout)]
      Commands::CatSample.should_receive(:run).with([], *inout)
      CLI.run ['sample'], *inout
    end
  end
end

