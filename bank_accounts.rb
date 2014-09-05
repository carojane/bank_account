require_relative 'transaction'
require_relative 'account'
require 'pry'
require 'CSV'

##################################################
################### PROGRAM ######################
##################################################

CSV.foreach('balances.csv', headers: true) do |row|
  account = Account.new(row['Account'], row['Balance'])

  puts "==== #{account.name} ===="
  puts "Starting Balance: $#{sprintf '%.2f', account.starting_balance}"
  puts "Ending Balance:   $#{sprintf '%.2f', account.current_balance}"
  puts
  puts account.summary
  puts "========"
  puts
end
