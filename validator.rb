class Validator
  attr_reader :constraint

  def initialize(constraint = Constraints::anything)
    @constraint = constraint
  end

  def valid?(block)
    constraint.call(block.hash) 
  end
end
