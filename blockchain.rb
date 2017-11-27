require_relative 'block'
require_relative 'validator'
require_relative 'chain'

class Blockchain
  include Enumerable
  attr_reader :miner, :constraint, :validator, :root, :head

  def initialize(miner)
    @miner = miner
    @constraint = miner.constraint
    @validator = Validator.new(@constraint) 
    @root = build_root
    @head = @root
  end

  def build_block(payload)
    Block.new(payload, @head)
  end

  def build_root
    Block.new({})
  end

  def add_block(payload)
    @head = build_block(payload).tap do |block|
      @miner.mining!(block)
    end
  end
  alias :<< :add_block

  def each(&block)
    Chain.new(@head).each(&block)
  end

  def valid?
    all? {|block| validator.valid?(block) }
  end
end
