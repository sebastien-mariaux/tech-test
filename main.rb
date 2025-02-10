require_relative 'services/purchase_processor'

puts "Enter the path to the file containing the purchase data:"
file_path = gets.chomp

purchase_processor = PurchaseProcessor.new(file_path)
results = purchase_processor.call
results.each do |result|
  puts result
  puts "--------------------------------"
end
