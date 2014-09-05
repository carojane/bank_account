class Account
  attr_reader :name, :starting_balance
  def initialize(name, starting_balance)
    @name = name
    @starting_balance = starting_balance.to_f
  end

  def current_balance
    @current_balance = @starting_balance
    CSV.foreach('bank_data.csv', headers: true) do |row|
      if row['Account'] == @name
        @current_balance += row['Amount'].to_f
      end
    end
    @current_balance
  end

  def summary
    @transactions = []
    CSV.foreach('bank_data.csv', headers: true) do |row|
      if row['Account'] == @name
        transaction = Transaction.new(row)
        @transactions << transaction.summary
      end
    end
    @transactions
  end
end
