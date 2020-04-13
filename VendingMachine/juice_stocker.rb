class JuiceStocker
    attr_reader :stock_info

    def initialize
        @stock_info = Hash.new
    end

    def add_drink(drink)
        @stock_info.merge!(drink)
    end

    def pull_stock(drink_name)
        @stock_info[drink_name][1] = @stock_info[drink_name][1] - 1
    end
end

