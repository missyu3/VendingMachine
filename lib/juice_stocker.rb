class JuiceStocker

    def initialize
        @stock_info = Hash.new
    end

    def initialize_item(name,price)
      if @stock_info.has_key?(name.intern)
        puts("すでに登録されているジュースです。")
        puts("残量の追加はaddを使用してください")
      else
        drink = Hash.new
        drink[name.intern] = [price, 0]
        @stock_info.merge!(drink)
      end
    end

    def add(name,stock_count)
      if @stock_info.has_key?(name.intern)
        @stock_info[name.intern][1] += stock_count
      else
        puts("initialize_itemを先に実行してください")
      end
    end

    def change_price(name,price)
      if @stock_info.has_key?(name.intern)
        @stock_info[name.intern][0] = price        
      else
        puts("initialize_itemを先に実行してください")
      end
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

    def desplay_stock_info
      @stock_info.each do |key,value|
        puts "ドリンク名称:#{key}"
        puts "価格:#{value[0]}円"
        puts "在庫量:#{value[1]}"
        puts "ーーーーーーーーーーー"
      end
    end
    
    private

    def purchasable_item?(item,total_money)
      return item && has_stock?(item) && enough_money?(item,total_money)
    end

    def has_stock?(item)
      item[1] > 0
    end

    def enough_money?(item,total_money)
      total_money >= item[0] 
    end

end

