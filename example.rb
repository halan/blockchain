require 'pp'
require_relative 'miner'
require_relative 'constraints'
require_relative 'blockchain'

miner = Miner.new(Constraints::zeros(4))

blockchain = Blockchain.new(miner)

loop do

  puts "Please, digit some content:"
  print "--> "
  content = gets
  puts "Mining your content to store on the blockchain..."
  puts ""
  p blockchain << { content: content.chomp }
  puts '---'
  puts "\t Your chain has #{blockchain.count} blocks!"
  puts '---'
  p blockchain.root
  p blockchain.head
  blockchain.each{|block| p block.hash }
end
