require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    user = User.create
    item = Item.create
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')

    @transaction = FactoryBot.build(:transaction, user_id: user.id)
  end

  describe '商品購入機能' do
    context '商品の購入ができるとき' do
      it 'token,postal_code,prefecture_id,city,house_number,phone_numberが存在すれば購入できる' do
        expect(@transaction).to be_valid
      end
      it 'building_nameはなくても保存できる' do
        @transaction.building_name = nil
        expect(@transaction).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it 'tokenの値が送られてきていないと購入できない' do
        @transaction.token = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空だと保存できない' do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeは***-****（*は数字、ハイフンは4文字目）の形式でないと保存できない' do
        @transaction.postal_code = '1234-567'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('郵便番号は無効です。***-****の形式で入力してください')
      end
      it 'prefecture_idが1(---)だと保存できない' do
        @transaction.prefecture_id = 1
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空だと保存できない' do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと保存できない' do
        @transaction.house_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @transaction.phone_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberはハイフンなしの11桁でないと保存できない' do
        @transaction.phone_number = '123456789'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
