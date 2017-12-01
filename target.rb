# https://en.bitcoin.it/wiki/Difficulty
class Target
  def initialize(n)
    @n = n
    @exp = reverse[0,2].hex
    @mult = reverse[2,7].hex
  end

  def to_i
    @mult * 2**(8*(@exp - 3))
  end

  def reverse
    [@n].pack('L').reverse.unpack('H*')[0].upcase
  end

  def bits
    [@n].pack('L').unpack('H*')[0].upcase
  end

  def to_s
    to_i.to_s(16).rjust(64, '0')
  end

  def catch?(hexdigest)
    hexdigest.hex < to_i
  end
end
