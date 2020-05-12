require 'spec_helper'
require_relative '../lib/vending_machine'

describe VendingMachine do
  describe "自動販売機" do
    before  do
      @machine = VendingMachine.new
      @machine.initialize_item("cola",120)
      @machine.initialize_item("redbull",200)
      @machine.initialize_item("water",100)
      @machine.add("cola",4)
      @machine.add("redbull",7)
      @machine.change_price("cola",140)
    end
    context "お金投入" do
      it "対応されていない数字を入力した時、投入金額が変更されていないか" do
        @machine.insert_money(100)
        @machine.insert_money(50)
        @machine.insert_money(40)
        @machine.insert_money(10000)
        @machine.insert_money(1)
        expect(@machine.total_money).to eq 150
      end
    end
    context "商品購入" do
      it "残高の返却と売上金の追加が行われているか" do
        @machine.insert_money(100)
        @machine.insert_money(50)
        expect(@machine.purchase("cola")).to eq 10
        expect(@machine.total_money).to eq 0
        expect(@machine.sale_amount).to eq 140
      end
    end
  end
end
