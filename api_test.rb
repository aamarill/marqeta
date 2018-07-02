require_relative 'marqeta_api'

funds_amount = '1000'
transaction_amount = '20'

puts 'Creating card product.'
card_product = CardProduct.new("Card Generator")
# p "card_product.name: #{card_product.name}"
# p "card_product.token: #{card_product.token}"

puts 'Creating funding source.'
funding_source = FundingSource.new('Checking account')
# p "funding_source.name: #{funding_source.name}"
# p "funding_source.token: #{funding_source.token}"

puts 'Creating a user.'
user1 = User.new
# p "user1.token: #{user1.token}"

puts 'Creating a card using the card product.'
card1 = Card.new(user1.token, card_product.token)
# p "card1.token: #{card1.token}"

puts 'Adding funds to user from funding source.'
gpaorder1 = Gpaorder.new(user1.token, funds_amount, 'USD', funding_source.token)
# p "gpaorder1.token: #{gpaorder1.token}"

puts 'Simulating a transaction'
authorization1 = Authorization.new(transaction_amount, '1234567890', card1.token)
# puts "JSON.parse(authorization1.response.body): #{JSON.parse(authorization1.response.body)}"
response_body = JSON.parse(authorization1.response.body)
transaction = response_body['transaction']
# puts "transaction.keys: #{transaction.keys}"
# puts "memo: #{transaction['response']['memo']}"
# puts "gpa: #{transaction['gpa']}"
balances = transaction['gpa']['balances']['USD']
puts "Starting balance: #{balances['ledger_balance']}"
puts "Expense amount: #{balances['impacted_amount']}"
puts "New account balance: #{balances['available_balance']}"
