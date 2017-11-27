require 'pp'
require_relative 'block'
require_relative 'miner'
require_relative 'validator'
require_relative 'constraints'
require_relative 'chain'

class Blockchain
  include Enumerable
  attr_reader :miner, :constraint, :validator, :root, :head

  def initialize(miner)
    @miner = miner
    @constraint = miner.constraint
    @validator = Validator.new(@constraint) 
    @root = Block.new({})
    @head = @root
  end

  def build_block(payload)
    Block.new(payload, @head)
  end

  def add_block(payload)
    build_block(payload).tap do |block|
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

miner = Miner.new(Constraints::zeros(5))

blockchain = Blockchain.new(miner)
blockchain << {a: 2}
blockchain << {a: 3}
blockchain << {a: 4}
blockchain << {a: 5}

p blockchain.valid?
