class Transfer
#   # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount  = amount
    @status = "pending"
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    # if sender.balance > amount && status == "pending"
    # binding.pry
    if status == "pending" && self.sender.balance > amount && valid?
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end


end
