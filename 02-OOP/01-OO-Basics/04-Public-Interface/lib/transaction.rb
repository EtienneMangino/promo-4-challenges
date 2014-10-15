# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @time = Time.now
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    (@amount >= 0 ? "+ " : "- ") + "#{@amount} € on #{@time.strftime("%m/%d/%Y")} at #{@time.strftime("%I:%M %p")}"
  end
end
