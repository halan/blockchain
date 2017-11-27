require 'digest'
require_relative 'miner'

class Block
  attr_reader :hash, :payload, :parent

  def initialize(payload = {})
    @payload = payload
    @parent = @payload.fetch(:parent, nil)
    @payload[:parent] = @parent.hash unless @parent.nil?

    @hash = calculate_hash
  end

  def nounce=(nounce = 0)
    @payload[:nounce] = nounce
    @hash = calculate_hash
  end

  def nounce
    @payload[:nounce]
  end

  def payload
    @payload.merge(hash: @hash)
  end

  def inspect
    payload
  end

  private

  def calculate_hash
    Digest::SHA1.hexdigest(@payload.to_s)
  end
end
