module Iambic
  class CLI < Command
    def run
      command_class(args.first).run args.drop(1), stdin, stdout
    end

    private

    def command_class(name)
      case name
      when 'sample'
        Commands::CatSample
      else
        Commands::FindViolations
      end
    end
  end
end

