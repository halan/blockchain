require 'pp'
require_relative 'miner'
require_relative 'constraints'
require_relative 'blockchain'

miner = Miner.new(Constraints::zeros(5))

blockchain = Blockchain.new(miner)
p blockchain.head

blockchain << {a: 2}
p blockchain.head

blockchain << {a: 3}
p blockchain.head

blockchain << {a: 4}
p blockchain.head

blockchain << {a: 5}
p blockchain.head

p blockchain.valid?
