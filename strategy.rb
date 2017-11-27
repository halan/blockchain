module Strategy
  def self.incremental
    Enumerator.new do |y|
      a = 0
      loop { y << (a += 1) }
    end
  end

  def self.random
    Enumerator.new {|y| loop { y << rand(2*200) } }
  end
end
