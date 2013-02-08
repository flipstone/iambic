require 'iambic/version'

module Iambic
  autoload :Dictionary, 'iambic/dictionary'
  autoload :LexicalItem, 'iambic/lexical_item'
  autoload :Lexicon, 'iambic/lexicon'
  autoload :Line, 'iambic/line'
  autoload :Pronounciation, 'iambic/pronounciation'
  autoload :Stress, 'iambic/stress'
  autoload :StressPattern, 'iambic/stress_pattern'
  autoload :Word, 'iambic/word'
  autoload :Work, 'iambic/work'

  L = Stress::L
  H = Stress::H
end
