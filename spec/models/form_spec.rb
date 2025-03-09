require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    @form = FactoryBot.build(:form, user_id: user.id)
  end
  describe '寄付情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@form).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @form.building = ''
        expect(@form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'address_numberが空だと保存できないこと' do
        @form.address_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address number can't be blank")
      end
      it 'address_numberが7桁の半角文字列では保存できないこと' do
        @form.address_number = '1111111'
        @form.valid?
        expect(@form.errors.full_messages).to include('Address number is invalid')
      end
      it 'region_idが1だと保存できないこと' do
        @form.region_id = '1'
        @form.valid?
        expect(@form.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @form.street = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @form.phone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満だと保存できないこと' do
        @form.phone_number = '000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁より多いと保存できないこと' do
        @form.phone_number = '000000000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
