require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context 'ユーザー新規登録ができるとき' do   
      it 'nickname、email、password、password_confirmation、
      kanji_first_name、kanji_last_name、kana_first_name、 kana_last_name、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字（漢字）が空では登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end
      it '名字（漢字）が半角では登録できない' do
        @user.kanji_first_name = 'ｻｸﾏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name is invalid')
      end
      it '名前（漢字）が空では登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end
      it '名前（漢字）が半角では登録できない' do
        @user.kanji_last_name = 'ｻｸﾏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji last name is invalid')
      end
      it '名字（カナ）が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it '名字（カナ）が半角では登録できない' do
        @user.kana_first_name = 'ｻｸﾏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it '名前（カナ）が空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it '名前（カナ）が半角では登録できない' do
        @user.kana_last_name = 'ｻｸﾏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
