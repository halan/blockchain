require_relative 'block'

class Validator
  def initialize(constraint = Constraints::anything)
    @constraint = constraint
  end

  def valid?(block)
    @constraint.call(block.hash) 
  end

  def valid_chain?(block)
    valid?(block) && (block.parent == Block::ROOT ? true : valid_chain?(block.parent))
  end
end
