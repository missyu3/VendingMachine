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
  
  def initialize_drink(name,price)
    @stock_info.initialize_drink(name,price)
  end

  def add_drink(name,stock_count)
    @stock_info.add_drink(name,stock_count)
  end

  def set_price(name,price)
    @stock_info.set_price(name,price)
  end

  def insert_money(money)
    return money unless @register.check_money?(money)
    @register.insert(money)
  end

  def purchasable?(name)
    info = @stock_info.stock_info[name.intern]
    return false unless info 
    return false if info[1] <= 0
    return false if @register.total_money < info[0] 
    true
  end

  def purchasable_drink_names
    purchasable_drink = []
    @stock_info.stock_info.each do |key,value|
      next if value[1] <= 0
      next if @register.total_money < value[0] 
      purchasable_drink << key.to_s
    end
    purchasable_drink
  end
  
  def purchase(name)
    return nil unless purchasable?(name)
    @stock_info.pull_stock(name)
    info = @stock_info.stock_info[name.intern]
    @register.add_sale(info[0])
    @register.refund
  end



end