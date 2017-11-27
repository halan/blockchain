class Validator
  def initialize(constraint = Constraints::anything)
    @constraint = constraint
  end

  def valid?(block)
    @constraint.call(block.hash) 
  end

  def valid_chain?(block)
    valid?(block) && (block.parent ? valid_chain?(block.parent) : true)
  end
end
