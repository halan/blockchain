require 'pp'
require_relative 'blockchain'

blockchain = Blockchain.new

loop do

  puts "Please, digit some content:"
  print "--> "
  content = gets
  puts "Mining your content to store on the blockchain... (aprox. 10 minutes)"
  puts Time.now
  puts ""
  blockchain.add_block({ content: content.chomp }) do |b|
    print "\r#{b.nonce} -> #{b.hash}"
  end
  puts Time.now
  p blockchain.head
  puts '---'
  puts "\t Your chain has #{blockchain.count} blocks!"
  puts '---'

  puts ''
  blockchain.each{|block| p block.hash }
  puts ''
end
