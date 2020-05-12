class MoneyRegister
  attr_reader :total_money, :sale_amount
  MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @total_money = 0
    @sale_amount = 0
  end

  def check_money?(money)
    judge_money = MONEY.include?(money)
    puts ("#{money}円は使用できません。") unless judge_money
    judge_money
  end

  def insert(money)
    @total_money += money
    puts ("#{money}円投入しました。")
  end

  def refund
    money = @total_money
    @total_money = 0
    puts "お釣りは#{money}円です。"
    money
  end

  def add_sale(sale)
    @total_money -= sale
    @sale_amount += sale
  end

end
