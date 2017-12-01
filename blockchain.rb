require_relative 'block'
require_relative 'chain'
require_relative 'miner'

class Blockchain
  include Enumerable
  attr_reader :root, :head

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
    all? {|b| Miner.valid?(b) }
  end

  def get(hash)
    find{|block| block.hash == hash }
  end

  private

  def mining!(block)
    block.tap {|b| Miner.mining!(b) } 
  end
end
