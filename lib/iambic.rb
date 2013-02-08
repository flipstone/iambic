require 'iambic/version'
require 'hamster'

module Iambic
  autoload :Dictionary, 'iambic/dictionary'
  autoload :LexicalStress, 'iambic/lexical_stress'
  autoload :Line, 'iambic/line'
  autoload :Stress, 'iambic/stress'
  autoload :StressPattern, 'iambic/stress_pattern'
  autoload :Word, 'iambic/word'
  autoload :Work, 'iambic/work'

  L = Stress::L
  H = Stress::H
end
