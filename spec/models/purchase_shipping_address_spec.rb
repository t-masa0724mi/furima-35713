require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
  end
  
  context "商品購入できる時" do
    it "必要な値が存在すれば購入できる" do
      expect(@purchase_shipping_address).to be_valid
    end
  end
  
  context "商品購入できない時" do
    it "郵便番号が空だと購入できない" do
      @purchase_shipping_address.postal_code = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end  
    it "郵便番号には-がないと購入できない" do
      @purchase_shipping_address.postal_code = "1111111"
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid")
    end  
    it "shipping_area_idが1では購入できない" do
      @purchase_shipping_address.shipping_area_id = 1
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Shipping area must be other than 1")
    end  
    it "市区町村が空では購入できない" do
      @purchase_shipping_address.municipality = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
    end  
    it "番地が空では購入できない" do
      @purchase_shipping_address.house_number = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
    end  
    it "電話番号が空では購入できない" do
      @purchase_shipping_address.phone_number = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end  
    it "電話番号が11桁以内だと購入できる" do
      @purchase_shipping_address.phone_number = "00000000000000"
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is too long")
    end  
    it "クレジットカードの情報が正しくないと購入できない" do
      @purchase_shipping_address.token = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
    end  
  end  
end
