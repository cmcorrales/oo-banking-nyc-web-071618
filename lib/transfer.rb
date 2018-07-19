require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  # your code here
  def initialize(sender, receiver, amount)
    #puts "print agrs :",name.name, sender.name, arg3
    #binding.pry
    @receiver = receiver
    @sender=sender 
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction()
    # binding.pry
    if valid? == true && @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete" 
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end


end
