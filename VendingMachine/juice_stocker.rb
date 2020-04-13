require_relative  './error_message'
class JuiceStocker < ErrorMessage
  attr_reader :stock_info, :error

    def initialize
        @stock_info = Hash.new
        super
    end

    def initialize_drink(name,price)
      if @stock_info.has_key?(name.intern)
        @error.queue("すでに登録されているジュースです。")
      else
        drink = change_hash(name, price: price)
        @stock_info.merge!(drink)
      end
      @error.dequeue
    end

    def add_drink(name,stock_count)
      if @stock_info.has_key?(name.intern)
        @stock_info[name.intern][1] += stock_count
      else
        @error.set("initialize_drinkを先に実行してください")
      end
      @error.dequeue
    end

    def set_price(name,price)
      if @stock_info.has_key?(name.intern)
        @stock_info[name.intern][0] = price        
      else
        @error.set("initialize_drinkを先に実行してください")
      end
      @error.dequeue
    end

    def pull_stock(name)
        @stock_info[name.intern][1] -= 1
    end
    
    private
    def change_hash(name, price: 0, stock_count: 0)
      puts "0"
      drink = Hash.new
      drink[name.intern] = [price, stock_count]
      puts "1"
    end
end

