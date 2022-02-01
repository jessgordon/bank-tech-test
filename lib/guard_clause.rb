class GuardClause
  DEFAULT_DECIMAL_POINTS = 2

  class << self
    def amount(amount)
      raise "Amount must be a number" unless ((amount.is_a? Float) || (amount.is_a? Integer))
      raise "Amount cannot be zero" if amount.zero?
      return unless decimal_points(amount) > DEFAULT_DECIMAL_POINTS
      raise "Amount cannot have more than two decimal points" 
    end
    
    def enough_funds(amount, balance)
      return unless amount > balance
      raise "Not enough funds to withdraw #{
                      format_currency(amount)
                    } - current balance #{
                      format_currency(balance)
                    }"
    end

    private

    def decimal_points(amount)
      amount.to_f.to_s.split(".").last.length
    end

    def format_currency(float)
      format("%.#{DEFAULT_DECIMAL_POINTS}f", float)
    end
  end
end
