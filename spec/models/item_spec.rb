require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end  

  describe '出品商品登録' do
    context '商品が登録出来るとき' do
      it '全ての値が存在すれば登録できること' do
        expect(@item).to be_valid
      end  
    end 
    context '商品が登録出来ない時' do
      it 'imageが空では登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end  
      it 'nameが空では登録出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end  
      it 'descriptionが空では登録出来ない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end  
      it 'category_idが1では登録出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end  
      it 'condition_idが1では登録出来ない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end 
      it 'shipping_charge_idが1では登録出来ない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end  
      it 'shipping_area_idが空では登録出来ない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end  
      it 'day_to_ship_idが1では登録出来ない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
      end  
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end  
      it 'priceは300~9999999の間のみ保存できる' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end  
      it '商品価格が10000000円以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end  
      it 'priceは半角数字のみ保存できる' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end  
      it '商品価格が半角英数字混合では出品できない' do
        @item.price = '11111a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end  
      it '商品価格が半角英字のみでは出品できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end  
    end  
  end   
end
