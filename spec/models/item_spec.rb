require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it 'image,name,explanation,category_id,condition_id,delivery_charge_id,pref_id,days_to_ship_id,price,user_idが存在すれば新規登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品画像を設定してください"
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを設定してください"
      end
      it 'condition_idが1では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を設定してください"
      end
      it 'delivery_charge_idが1では出品できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を設定してください"
      end
      it 'pref_idが1では出品できない' do
        @item.pref_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を設定してください"
      end
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を設定してください"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it 'priceが300未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300~9,999,999の範囲で指定してください'
      end
      it 'priceが10,000,000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300~9,999,999の範囲で指定してください'
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
      it 'priceが全角英字では出品できない' do
        @item.price = 'ABCDEF'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
      it 'priceが文字では出品できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
