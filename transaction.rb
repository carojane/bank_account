class Transaction
  def initialize(trans_data)
    @date = trans_data['Date']
    @amount = trans_data['Amount'].to_f
    if @amount > 0
      @type = "DEPOSIT"
    else
      @type = "WITHDRAWAL"
    end
    @amount = @amount.abs
    @description = trans_data['Description']
  end

  def deposit?
    if @type == "DEPOSIT"
      true
    else
      false
    end
  end

  def summary
    @summary = "$#{sprintf '%.2f', @amount}".ljust(10) + "#{@type}".ljust(12) + "#{@date} - #{@description}"
  end
end
