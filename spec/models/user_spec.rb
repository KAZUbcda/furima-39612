require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,date_of_birthが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'メールアドレスはすでに存在します'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには全角文字を除く英字と数字の両方を含めて設定してください'
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには全角文字を除く英字と数字の両方を含めて設定してください'
      end
      it 'passwordに全角文字が含まれていると登録できない' do
        @user.password = '123abcあいう'
        @user.password_confirmation = '123abcあいう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには全角文字を除く英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '456def'
        @user.password_confirmation = '456defg'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角):名字を入力してください"
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.last_name = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前(全角):名字は全角(漢字・ひらがな・カタカナ)を使用してください'
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角):名前を入力してください"
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)以外では登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前(全角):名前は全角(漢字・ひらがな・カタカナ)を使用してください'
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角):名字を入力してください"
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前(全角):名字は全角カタカナを使用してください'
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角):名前を入力してください"
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前(全角):名前は全角カタカナを使用してください'
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end
