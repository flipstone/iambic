require 'iambic/version'

module Iambic
  autoload :CLI, 'iambic/cli'
  autoload :Command, 'iambic/command'
  autoload :Commands, 'iambic/commands'
  autoload :Dictionary, 'iambic/dictionary'
  autoload :LexicalItem, 'iambic/lexical_item'
  autoload :Lexicon, 'iambic/lexicon'
  autoload :Line, 'iambic/line'
  autoload :Meter, 'iambic/meter'
  autoload :Pronounciation, 'iambic/pronounciation'
  autoload :Sample, 'iambic/sample'
  autoload :Source, 'iambic/source'
  autoload :Stress, 'iambic/stress'
  autoload :StressPattern, 'iambic/stress_pattern'
  autoload :Word, 'iambic/word'
  autoload :Work, 'iambic/work'
  autoload :Violation, 'iambic/violation'

  L = Stress::L
  H = Stress::H

  def self.iambic_pentameter
    Meter.new StressPattern.new [L,H]*5
  end
end
