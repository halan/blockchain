class Chain
  include Enumerable
  attr_reader :first

  def initialize(block)
    @first = block
  end

  def each
    current = first
    yield(current)

    until current.root?
      current = current.parent
      yield(current)
    end
  end
end
