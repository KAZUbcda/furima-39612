require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it 'image,name,explanation,category_id,condition_id,delivery_charge_id,pref_id,days_to_ship_id,priceが存在すれば新規登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_charge_idが1では出品できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it 'pref_idが1では出品できない' do
        @item.pref_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Pref can't be blank"
      end
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9,999,999の範囲で指定してください"
      end
      it 'priceが10,000,000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は300~9,999,999の範囲で指定してください"
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが全角英字では出品できない' do
        @item.price = 'ABCDEF'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが文字では出品できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end