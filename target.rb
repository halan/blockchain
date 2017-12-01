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

  def catch?(hexdigest)
    hexdigest.hex < to_i
  end
end
