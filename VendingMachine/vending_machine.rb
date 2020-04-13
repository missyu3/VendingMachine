class VendingMachine
  require_relative  './register'
  require_relative  './juice_stocker'
  
  def initialize
    @stock_info = JuiceStocker.new
    @register = Register.new
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

  def purchasable_drink_names
    purchasable_drink = []
    @stock_info.stock_info.each do |key,value|
      next if value[1] <= 0
      next if @register.total_money < value[0] 
      purchasable_drink << key.to_s
    end
    purchasable_drink
  end
  
end