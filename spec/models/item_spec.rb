require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品ができる時' do   
      it 'item_name、explanation、category_id、status_id、
      burden_id、region_id、day_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができないとき' do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '説明文が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが---だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担が---だと登録できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it '発送元の地域が空では登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300未満では登録できない' do
        @item.price = 44
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が9999999より上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end