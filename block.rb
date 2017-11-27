require 'digest'
require_relative 'miner'

class Block
  ROOT = :root
  attr_reader :hash, :payload, :parent

  def initialize(payload = {}, parent = ROOT)
    @payload = payload
    @parent = parent

    @hash = calculate_hash
  end

  def nounce=(nounce = 0)
    @payload[:nounce] = nounce
    @hash = calculate_hash
  end

  def nounce
    @payload[:nounce]
  end

  def parent_hash
    root? ? ROOT : parent.hash 
  end

  def payload
    pre_hash.merge(hash: @hash )
  end

  def inspect
    payload
  end

  def root?
    parent == ROOT
  end

  private

  def pre_hash
    @payload.merge(parent: parent_hash )
  end

  def calculate_hash
    Digest::SHA1.hexdigest(pre_hash.to_s)
  end
end
