require 'digest'

module Digest
  def self.text(hash)
    hash.map{|key, value| "#{key}: #{value}"}.join("\n")
  end

  def self.digest(hash)
    Digest::SHA256.hexdigest(
      Digest::SHA256.digest(
        text(hash)
      )
    )
  end
end
