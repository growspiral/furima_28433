require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品出品機能' do
    context '商品の出品ができるとき' do
      it '必須項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明が空だと出品できない' do
        @item.comment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'カテゴリーが--だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が--だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担が--だと出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it '発送元の地域が--だと出品できない' do
        @item.ship_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship origin must be other than 1')
      end
      it '発送までの日数が--だと出品できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day must be other than 1')
      end
      it '価格が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300より低ければ出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9999999より高ければ出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb
