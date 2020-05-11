class MoneyRegister
  attr_reader :total_money, :sale_amount
  MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @total_money = 0
    @sale_amount = 0
  end

  def check_money?(money)
    MONEY.include?(money)
  end

  def insert(money)
    @total_money += money
  end

  def refund
    money = @total_money
    @total_money = 0
    money
  end

  def add_sale(sale)
    @total_money -= sale
    @sale_amount += sale
  end

end
