class VendingMachine
  require_relative  './register'
  require_relative  './juice_stocker'
  
  def initialize
    @stock_info = JuiceStocker.new
    @register = Register.new
  end

  def stock_info
    @stock_info.stock_info.keys
  end

  def total_money
    @register.total_money
  end

  def sale_amount
    @register.sale_amount
  end
  
  def initialize_item(name,price)
    @stock_info.initialize_item(name,price)
  end

  def add_drink(name,stock_count)
    @stock_info.add(name,stock_count)
  end

  def set_price(name,price)
    @stock_info.set_price(name,price)
  end

  def insert_money(money)
    return money unless @register.check_money?(money)
    @register.insert(money)
  end

  def purchasable?(name)
    @stock_info.purchasable?(name,@register.total_money)
  end

  def purchasable_names
    @stock_info.purchasable_names(@register.total_money)
  end
  
  def purchase(name)
    return nil unless purchasable?(name)
    @stock_info.pull_stock(name)
    price = @stock_info.get_price(name)
    @register.add_sale(price)
    @register.refund
  end

end