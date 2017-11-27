module Constraints
  def self.anything
    ->(x) { true }
  end

  def self.zeros(dificulty)
    ->(x) { x[/^0+/].to_s.length >= dificulty }
  end
end
