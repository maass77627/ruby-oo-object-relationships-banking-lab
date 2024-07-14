class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
end

def valid?
  self.sender.valid? && self.receiver.valid?

end

def execute_transaction()
   if sender.balance > amount && valid? && self.status == "pending"
 sender.balance -= amount 
  receiver.balance += amount
  self.status = "complete"
else
   reject_transfer
 end
  
end

def reverse_transfer
  if valid? && receiver.balance > amount && self.status == "complete"
    receiver.balance -= amount 
    sender.balance += amount
    self.status = "reversed"
  else
    reject_transfer
  end
end

def reject_transfer
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end


end
