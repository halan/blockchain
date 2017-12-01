require_relative 'block'
require_relative 'chain'
require_relative 'miner'

class Blockchain
  include Enumerable
  attr_reader :root, :head

  def build_block(payload)
    Block.new(payload, head)
  end

  def add_block(payload, &block)
    mining!(build_block(payload), &block).tap do |blk|
      @head = blk
      @root = blk if @root.nil?
    end
  end
  alias :<< :add_block

  def each(&block)
    Chain.new(head).each(&block)
  end

  def valid?
    all? {|b| Miner.new(b).valid? }
  end

  def get(hash)
    find{|block| block.hash == hash }
  end

  private

  def mining!(blk, &block)
    blk.tap do |b|
      Miner.new(b).mining!(&block)
    end
  end
end
