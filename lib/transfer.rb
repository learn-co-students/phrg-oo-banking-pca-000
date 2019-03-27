require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && status == "pending"
      if amount < @sender.balance
         @sender.balance -= amount
         @receiver.balance += amount
         @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    # binding.pry
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= amount
      @sender.balance += amount
      @status = "reversed"
    end
  end

end
