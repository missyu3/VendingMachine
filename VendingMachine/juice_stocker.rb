require_relative  './error_message'
class JuiceStocker < ErrorMessage
  attr_reader :stock_info, :error

    def initialize
        @stock_info = Hash.new
        super
    end

    def initialize_item(name,price)
      if @stock_info.has_key?(name.intern)
        queue("すでに登録されているジュースです。")
      else
        drink = change_hash(name, price: price)
        @stock_info.merge!(drink)
      end
      dequeue
    end

    def add(name,stock_count)
      if @stock_info.has_key?(name.intern)
        @stock_info[name.intern][1] += stock_count
      else
        queue("initialize_drinkを先に実行してください")
      end
      dequeue
    end

    def set_price(name,price)
      if @stock_info.has_key?(name.intern)
        @stock_info[name.intern][0] = price        
      else
        queue("initialize_drinkを先に実行してください")
      end
      dequeue
    end

    def get_price(name)
      @stock_info[name.intern][0]
    end

    def pull_stock(name)
        @stock_info[name.intern][1] -= 1
    end

    def purchasable?(name,total_money)
      info = @stock_info[name.intern]
      purchasable_item?(info,total_money)
    end

    def purchasable_names(total_money)
      purchasable_names = []
      @stock_info.each do |key,value|
        next unless purchasable_item?(value,total_money)
        purchasable_names << key.to_s
      end
      purchasable_names
    end

    
    private
    def change_hash(name, price: 0, stock_count: 0)
      drink = Hash.new
      drink[name.intern] = [price, stock_count]
      drink
    end

    def purchasable_item?(item,total_money)
      return false unless item 
      return false if item[1] <= 0
      return false if total_money < item[0] 
      true
    end

end

