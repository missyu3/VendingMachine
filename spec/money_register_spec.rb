require 'spec_helper'
require_relative '../lib/money_register'

describe MoneyRegister do
  describe "レジ" do
    before  do
      @register = MoneyRegister.new
    end
    context "check_money?" do
      it "許可されている金額の時Trueが返るか" do
        expect(@register.check_money?(10)).to eq true
        expect(@register.check_money?(50)).to eq true
        expect(@register.check_money?(100)).to eq true
        expect(@register.check_money?(500)).to eq true
        expect(@register.check_money?(1000)).to eq true
      end
      it "許可されていない金額の時Falseが返るか" do
        expect(@register.check_money?(11)).to eq false
        expect(@register.check_money?(49)).to eq false
        expect(@register.check_money?(0)).to eq false
        expect(@register.check_money?(-100)).to eq false
      end
    end
    context "insert" do
      it "投入されたお金が累計額に加算されているか" do
        @register.insert(100)
        @register.insert(100)
        expect(@register.total_money).to eq 200
      end
    end
    context "refund" do
      it "投入されたお金が返却されているか" do
        @register.insert(1000)
        @register.insert(100)
        expect(@register.refund).to eq 1100
      end
      it "返金後は投入金額が0になっているか" do
        @register.insert(1000)
        @register.insert(100)
        @register.refund
        expect(@register.total_money).to eq 0
      end
    end
    context "add_sale" do
      it "投入金額の合計が売上金の分引かれているか" do
        @register.insert(1000)
        @register.insert(100)
        @register.add_sale(120)
        expect(@register.total_money).to eq 980
      end
      it "売上金の合計に売り上げ金が加算されているか" do
        @register.insert(1000)
        @register.add_sale(120)
        @register.add_sale(120)
        expect(@register.sale_amount).to eq 240
      end
    end
  end
end
