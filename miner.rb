require_relative 'constraints'
require_relative 'sequences'

class Miner
  attr_reader :constraint, :sequence

  def initialize(
    constraint = Constraints::anything,
    sequence = Sequences::incremental
  )
    @constraint = constraint
    @sequence = sequence
  end

  def mining!(block)
    sequence.find do |nonce|
      block.nonce = nonce
      constraint.call(block.hash)
    end
  end
end


