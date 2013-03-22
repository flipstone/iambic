module Iambic
  module Commands
    class FindViolations < Command
      def run
        work = Work.parse Source.new(stdin)
        violations = Iambic.iambic_pentameter.violations work, lexicon

        puts "Found violations on #{violations.count} lines:"
        puts

        violations.each do |violation|
          line = violation.line.words.map(&:word).map(&:string).join(' ')
          puts "#{violation.string.line_number}: #{violation.word} in \"#{line}\""
        end
      end

      private

      def lexicon
        @lexicon ||= Lexicon.new Dictionary.load_cmu
      end
    end
  end
end
