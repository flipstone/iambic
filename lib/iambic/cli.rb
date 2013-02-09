module Iambic
  class CLI
    attr_reader :args, :stdin, :stdout

    def initialize(args, stdin, stdout)
      @args = args
      @stdin = stdin
      @stdout = stdout
    end

    def run
      work = Work.parse stdin
      violations = Iambic.iambic_pentameter.violations work, lexicon

      puts "Found violations on #{violations.count} lines:"
      puts

      violations.each do |violation|
        line = violation.line.words.map(&:word).map(&:string).join(' ')
        puts "#{violation.word} in \"#{line}\""
      end
    end

    private

    def puts(*args)
      stdout.puts *args
    end

    def lexicon
      @lexicon ||= Lexicon.new Dictionary.load_cmu
    end
  end
end
