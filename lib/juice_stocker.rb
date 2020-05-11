class JuiceStocker

    def initialize
        @stock = Hash.new
    end

    def initialize_item(name,price)
      if @stock.has_key?(name.intern)
        puts <<~TEXT
          すでに登録されているジュースです。
          在庫の追加はaddを使用してください。
        TEXT
      else
        drink = Hash.new
        drink[name.intern] = [price, 0]
        @stock.merge!(drink)
        puts <<~TEXT
          #{name}を登録しました。
          addを実行し、在庫を追加してください。
        TEXT
      end
    end

    def add(name,stock_count)
      if @stock.has_key?(name.intern)
        @stock[name.intern][1] += stock_count
        puts ("在庫に#{name}を#{stock_count}本追加しました。")
      else
        puts <<~TEXT
          #{name}はまだ登録されていません。
          initialize_itemを先に実行してください。
        TEXT
      end
    end

    def change_price(name,price)
      if @stock.has_key?(name.intern)
        @stock[name.intern][0] = price
        puts ("#{name}の値段を#{price}に変更しました。")
      else
        puts <<~TEXT
          #{name}はまだ登録されていません。
          initialize_itemを先に実行してください。
        TEXT
      end
    end

    def get_price(name)
      @stock[name.intern][0]
    end

    def pull_stock(name)
        @stock[name.intern][1] -= 1
        puts ("#{name}を購入しました。")
    end

    def purchasable?(name,total_money)
      item = @stock[name.intern]
      purchasable_item?(item,total_money)
    end

    def purchasable_names(total_money)
      purchasable_names = []
      @stock.each do |key,value|
        next unless purchasable_item?(value,total_money)
        purchasable_names << key.to_s
      end
      puts ("以下が購入可能です。")
      purchasable_names
    end

    def desplay_stock_info
      @stock.each do |key,value|
        puts <<~TEXT
          ドリンク名称:#{key}
          価格:#{value[0]}円
          在庫量:#{value[1]}
          ーーーーーーーーーーー
        TEXT
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
