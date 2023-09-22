require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入記録の保存' do
    context '商品購入記録が保存できる時' do
      it 'post_code,pref_id,municipalities,street_address,bldg_name,tel_number,purchase_recordが存在していれば保存できる' do
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'bldg_nameが空でも保存できる' do
        @purchase_record_shipping_address.bldg_name = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
    end
    context '商品購入記録が保存できない時' do
      it 'post_codeが空では保存できない' do
        @purchase_record_shipping_address.post_code = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」でなければ保存できない' do
        @purchase_record_shipping_address.post_code = '1234-567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code は半角数字「3桁ハイフン4桁」の形式で入力してください")
      end
      it 'post_codeが全角数字では保存できない' do
        @purchase_record_shipping_address.post_code = '１２３-４５６７'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code は半角数字「3桁ハイフン4桁」の形式で入力してください")
      end
      it 'post_codeに文字が含まれていると保存できない' do
        @purchase_record_shipping_address.post_code = '12あ-456A'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code は半角数字「3桁ハイフン4桁」の形式で入力してください")
      end
      it 'pref_idがでは保存できない' do
        @purchase_record_shipping_address.pref_id = '1'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Pref can't be blank") 
      end
      it 'municipalitiesが空では保存できない' do
        @purchase_record_shipping_address.municipalities = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空では保存できない' do
        @purchase_record_shipping_address.street_address = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Street address can't be blank") 
      end
      it 'tel_numberが空では保存できない' do
        @purchase_record_shipping_address.tel_number = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが10桁未満では保存できない' do
        @purchase_record_shipping_address.tel_number = '090123456'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Tel number は10桁以上11桁以内の半角数字を入力してください")
      end
      it 'tel_numberが12桁以上では保存できない' do
        @purchase_record_shipping_address.tel_number = '090123456789'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Tel number は10桁以上11桁以内の半角数字を入力してください")
      end
      it 'tel_numberが全角数字では保存できない' do
        @purchase_record_shipping_address.tel_number = '０９０１２３４５６７'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Tel number は10桁以上11桁以内の半角数字を入力してください")
      end
      it 'tel_numberに文字が含まれていると保存できない' do
        @purchase_record_shipping_address.tel_number = '09012345あA'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Tel number は10桁以上11桁以内の半角数字を入力してください")
      end
      it 'tel_numberに-(ハイフン)が含まれていると保存できない' do
        @purchase_record_shipping_address.tel_number = '090-1234-567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Tel number は10桁以上11桁以内の半角数字を入力してください")
      end
      it 'tokenが空だと保存できない' do
        @purchase_record_shipping_address.token = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_record_shipping_address.user_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_record_shipping_address.item_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end
