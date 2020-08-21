require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品の出品ができるとき' do
      it 'image,name,textが存在し、category_id,condition_id,postage_id,ship_from_id,ship_date_idが1以外(---以外)で、priceが300~9999999の範囲のとき' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it 'imageが存在していないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが存在していないと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが存在していないと保存できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが1(---)だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが1(---)だと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'postage_idが1(---)だと保存できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it 'ship_from_idが1(---)だと保存できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from must be other than 1')
      end
      it 'ship_date_idが1(---)だと保存できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date must be other than 1')
      end
      it 'priceが存在していないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが10000000以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
