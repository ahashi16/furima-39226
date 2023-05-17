require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品する' do
    context '出品できる場合' do
      it 'product_name,description,genre_id,item_condition_id,shipping_fee_payer_id,shipping_area_id,shipping_day_id,price,user,imageが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it '商品名がからでは出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーを選択しないと出品できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Genre can't be blank"
      end
      it '商品の状態を選択しないと出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it '配送料の負担を選択しないと出品できない' do
        @item.shipping_fee_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee payer can't be blank"
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '販売価格を入力しないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'カテゴリーは数値でないと出品できない' do
        @item.genre_id = 'いち'
        @item.valid?
        expect(@item.errors.full_messages).to include "Genre can't be blank"
      end
      it '商品の状態は数値でないと出品できない' do
        @item.item_condition_id = 'いち'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it '配送料の負担は数値でないと出品できない' do
        @item.shipping_fee_payer_id = 'いち'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee payer can't be blank"
      end
      it '発送元の地域は数値でないと出品できない' do
        @item.shipping_area_id = 'いち'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '発送までの日数は数値でないと出品できない' do
        @item.shipping_day_id = 'いち'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '販売価格は数値でないと出品できない' do
        @item.price = 'いち'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'カテゴリーの１を選択すると出品できない' do
        @item.genre_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Genre can't be blank"
      end
      it '商品の状態の１を選択すると出品できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it '配送料の負担の１を選択すると出品できない' do
        @item.shipping_fee_payer_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee payer can't be blank"
      end
      it '発送元の地域の１を選択すると出品できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '発送までの日数の１を選択すると出品できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '販売価格は300円以上でないと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '販売価格は9,999,999円以下でないと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '１00'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
