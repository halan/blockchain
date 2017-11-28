module Sequences
  def self.incremental
    (0..Float::INFINITY  )
  end

  def self.random
    Enumerator.new {|y| loop { y << rand(2*200) } }
  end
end
