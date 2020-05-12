require 'spec_helper'
require_relative '../lib/juice_stocker'

describe JuiceStocker do
  describe "ジュース管理者" do
    before  do
      @stocker = JuiceStocker.new
    end
    context "initialize_item" do
      it "商品情報の初期化が行えているか" do
        @stocker.initialize_item("cola",120)
        item = {cola: [120,0]}
        expect(@stocker.send(:test_stock)).to eq item
      end
      it "同一の商品情報を初期化は行えないか" do
        @stocker.initialize_item("cola",120)
        @stocker.initialize_item("cola",140)
        item = {cola: [140,0]}
        expect(@stocker.send(:test_stock)).to_not eq item
      end
    end
    context "add" do
      before do
        @stocker.initialize_item("cola",120)
      end
      it "在庫数の追加が行えているか" do
        @stocker.add("cola",7)
        item = {cola: [120,7]}
        expect(@stocker.send(:test_stock)).to eq item
      end
    end
    context "change_price" do
      before do
        @stocker.initialize_item("cola",120)
      end
      it "単価の変更が行えているか" do
        @stocker.change_price("cola",150)
        item = {cola: [150,0]}
        expect(@stocker.send(:test_stock)).to eq item
      end
    end
    context "get_price" do
      before do
        @stocker.initialize_item("cola",120)
      end
      it "単価が返っているか" do
        expect(price = @stocker.get_price("cola")).to eq 120
      end
    end
    context "pull_stock" do
      before do
        @stocker.initialize_item("cola",120)
        @stocker.add("cola",7)
      end
      it "商品購入時に値を在庫数を差し引いているか" do
        @stocker.pull_stock("cola")
        item = {cola: [120,6]}
        expect(@stocker.send(:test_stock)).to eq item
      end
    end
    context "purchasable?" do
      before do
        @stocker.initialize_item("cola",120)
      end
      it "在庫数>0、投入金額==単価の場合、Trueが返っているか" do
        @stocker.add("cola",7)
        expect(@stocker.purchasable?("cola",120)).to eq true
      end
      it "在庫数>0、投入金額<単価の場合、Falseが返っているか" do
        @stocker.add("cola",7)
        expect(@stocker.purchasable?("cola",119)).to eq false
      end
      it "在庫数=0、投入金額==単価の場合、Falseが返っているか" do
        @stocker.add("cola",0)
        expect(@stocker.purchasable?("cola",120)).to eq false
      end
      it "在庫数=0、投入金額<単価の場合、Falseが返っているか" do
        @stocker.add("cola",0)
        expect(@stocker.purchasable?("cola",119)).to eq false
      end
    end
    context "purchasable?" do
      before do
        @stocker.initialize_item("cola",120)
        @stocker.initialize_item("redbull",200)
        @stocker.initialize_item("water",100)
        @stocker.initialize_item("sider",150)
        @stocker.add("cola",0)
        @stocker.add("redbull",7)
        @stocker.add("water",7)
        @stocker.add("sider",7)
      end
      it "在庫数==0,投入金額<単価の商品は表示されていないか" do
        expect(@stocker.purchasable_names(150)).to eq ["water","sider"]
      end
    end
  end
end
