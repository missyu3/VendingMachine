class VendingMachine
  require_relative  './money_register'
  require_relative  './juice_stocker'

  def initialize
    @stocker = JuiceStocker.new
    @register = MoneyRegister.new
  end

  def stock_info
    @stocker.desplay_stock_info
  end

  def total_money
    @register.total_money
  end

  def sale_amount
    @register.sale_amount
  end

  def initialize_item(name,price)
    @stocker.initialize_item(name,price)
  end

  def add(name,stock_count)
    @stocker.add(name,stock_count)
  end

  def change_price(name,price)
    @stocker.change_price(name,price)
  end

  def insert_money(money)
    @register.insert(money) if @register.check_money?(money)
  end

  def purchasable_names
    @stocker.purchasable_names(@register.total_money)
  end

  def purchase(name)
    return nil unless purchasable?(name)
    @stocker.pull_stock(name)
    price = @stocker.get_price(name)
    @register.add_sale(price)
    @register.refund
  end

  def purchasable?(name)
    @stocker.purchasable?(name,@register.total_money)
  end
end
