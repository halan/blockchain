require_relative 'miner'
require_relative 'digest'

class Block
  ROOT = 0.to_s(16).rjust(40, '0')
  attr_reader :hash, :payload, :parent, :parent_hash, :nonce

  def initialize(payload = {}, parent = nil)
    @parent = parent || ROOT
    @parent_hash = root? ? ROOT : parent.hash
    @payload = payload.merge(parent: @parent_hash)

    self.nonce = 0
  end

  def nonce=(nonce = 0)
    @nonce = nonce
    @hash = calculate_hash
  end

  def payload
    payload_with_nonce.merge(hash: hash)
  end

  def inspect
    Digest.text(payload)
  end

  def root?
    parent == ROOT
  end

  def ==(block)
    self.hash == block.hash
  end

  private

  def payload_with_nonce
    @payload.merge(nonce: nonce)
  end

  def calculate_hash
    Digest.digest(payload_with_nonce)
  end
end
