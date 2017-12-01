class Miner

  def initialize(block)
    @block = block
    @target = block.target
    @sequence = (0..Float::INFINITY)
  end

  def mining!(&block)
    @sequence.find do |nonce|
      @block.nonce = nonce
      valid?.tap do |valid|
        block.call(@block) if block
      end
    end
  end

  def valid?
    @target.catch? @block.hash
  end
end


