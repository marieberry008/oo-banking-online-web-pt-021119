class Transfer
attr_accessor :sender, :receiver, :amount, :status

def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
end

def valid?
    @sender.valid? && @receiver.valid? ? true : false
    # alternatively:
    # if sender.valid? && receiver.valid?
      # true
    # else
      # false
    # end
end

def execute_transaction
    if @sender.balance > @transfer_amount && @status == "pending"
      @sender.balance -= @transfer_amount
      @receiver.balance += @transfer_amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
end

def reverse_transfer
    if @status == "complete"
      @sender.balance += @transfer_amount
      @receiver.balance -= @transfer_amount
      @status = "reversed"
    end
end
  
end