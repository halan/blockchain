class Chain
  include Enumerable

  def initialize(block)
    @first = block
  end

  def each
    current = @first
    begin
      yield(current)
      current = current.parent
    end until current.root?
  end
end
