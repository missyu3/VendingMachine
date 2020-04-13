require_relative  './error_message'
class JuiceStocker < ErrorMessage
  attr_reader :stock_info, :error

    def initialize
        @stock_info = Hash.new
        super
    end

    def initialize_drink(name,price)
      if @stock_info.has_key?(name.intern)
        queue("すでに登録されているジュースです。")
      else
        drink = change_hash(name, price: price)
        @stock_info.merge!(drink)
      end
      dequeue
    end

    def add_drink(name,stock_count)
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

    def pull_stock(name)
        @stock_info[name.intern][1] -= 1
    end
    
    def change_hash(name, price: 0, stock_count: 0)
      drink = Hash.new
      drink[name.intern] = [price, stock_count]
      drink
    end
end

