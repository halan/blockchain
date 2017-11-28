require 'digest'

module Digest
  def self.text(hash)
    hash.map{|key, value| "#{key}: #{value}"}.join("\n")
  end

  def self.digest(hash)
    Digest::SHA1.hexdigest(
      text(hash)
    )
  end
end
