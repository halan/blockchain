require 'pp'
require_relative 'blockchain'

blockchain = Blockchain.new

loop do

  puts "Please, digit some content:"
  print "--> "
  content = gets
  puts Time.now
  puts "Mining your content to store on the blockchain... (aprox. 10 minutes)"
  puts Time.now
  puts ""
  p blockchain << { content: content.chomp }
  puts '---'
  puts "\t Your chain has #{blockchain.count} blocks!"
  puts '---'

  puts ''
  blockchain.each{|block| p block.hash }
  puts ''
end
