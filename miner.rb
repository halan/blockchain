module Miner

  module_function

  def mining!(block, sequence=(0..Float::INFINITY))
    sequence.find do |nonce|
      block.nonce = nonce
      valid? block
    end
  end

  def valid?(block)
    block.target.catch? block.hash
  end
end


