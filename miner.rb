require_relative 'constraints'
require_relative 'strategy'

class Miner
  attr_reader :constraint, :strategy

  def initialize(
    constraint = Constraints::anything,
    strategy = Strategy::incremental
  )
    @constraint = constraint
    @strategy = strategy
  end

  def mining!(block)
    @strategy.find do |nounce|
      block.nounce = nounce
      @constraint.call(block.hash)
    end
  end
end


