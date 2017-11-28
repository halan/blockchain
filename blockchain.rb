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
  end

  def build_block(payload)
    Block.new(payload, head)
  end

  def add_block(payload)
    mining!(build_block(payload)).tap do |block|
      @head = block
      @root = block if @root.nil?
    end
  end
  alias :<< :add_block

  def each(&block)
    Chain.new(head).each(&block)
  end

  def valid?
    all? {|block| validator.valid?(block) }
  end

  def get(hash)
    find{|block| block.hash == hash }
  end

  private

  def mining!(block)
    block.tap {|b| miner.mining!(b) } 
  end
end
