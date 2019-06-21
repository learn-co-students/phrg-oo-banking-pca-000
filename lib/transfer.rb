require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? == true && receiver.valid? == true ? true : false
  end

  def execute_transaction
    if @status == "pending"
      if sender.valid? == false || sender.balance < @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif sender.valid? == true
        @status = "complete"
        sender.balance -= @amount
        receiver.balance += @amount
      end
    elsif @status == "complete"
      "This transfer already happened."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
