module Constraints
  HASHBASE = 16
  HASHSIZE = 40

  def self.anything
    ->(x) { true }
  end

  def self.zeros(level)
    dificulty = (HASHBASE**(HASHSIZE-level)-1)

    ->(x) { x.to_i(HASHBASE) <= dificulty }
  end
end
