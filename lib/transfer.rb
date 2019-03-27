require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    sender.valid? && receiver.valid? ? true : false
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
  end
  def reverse_transfer
     if  @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end



