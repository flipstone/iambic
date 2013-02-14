module Iambic
  module Commands
    class CatSample < Command
      def run
        puts Sample.find(args.first).text
      end
    end
  end
end

