require 'Date'
  class Account
    attr_accessor :exp_date, :pin_code, :balance, :account_status, :owner

    STANDARD_VALIDITY_YRS = 5

    def initialize (attrs = {})
      @exp_date = set_expire_date
      @pin_code = generate_pin
      @balance = 0
      @account_status = :active
      set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def generate_pin
    rand(1000..9999)
  end

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

end
