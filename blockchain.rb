require 'pp'
require_relative 'block'
require_relative 'miner'
require_relative 'validator'
require_relative 'constraints'

constraint = Constraints::zeros(5)
miner = Miner.new(constraint)
validator = Validator.new(constraint)

b1 = Block.new({a: 2})
miner.mining!(b1)
pp b1.payload

b2 = Block.new({a: 4}, b1)
miner.mining!(b2)
pp b2.payload

b3 = Block.new({a: 5}, b2)
miner.mining!(b3)
pp b3.payload

b4 = Block.new({a: 7}, b3)
miner.mining!(b4)
pp b4.payload

p validator.valid_chain?(b4)
