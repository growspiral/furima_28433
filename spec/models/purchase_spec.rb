require 'rails_helper'

describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '必須項目が存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
      it 'クレジットカード情報が正しければ購入できる' do
      end
      it '郵便番号にハイフンを含んでいれば購入できる' do
      end
      it '電話番号にハイフンが含まれず、11けた以内の数字であれば購入できる' do
      end
      # bundle exec rspec spec/models/purchase_spec.rb
    end
    context '商品の購入ができないとき' do
      it 'クレジットカード情報が空だと購入できない' do
      end
      it 'クレジットカード情報が正しくなければ購入できない' do
      end
      it '郵便番号が空だと購入できない' do
      end
      it '都道府県が空だと購入できない' do
      end
      it '市区町村が空だと購入できない' do
      end
      it '番地が空だと購入できない' do
      end
      it '電話番号が空だと購入できない' do
      end
      it '郵便番号にハイフンが含まれていなければ購入できない' do
      end
      it '電話番号にハイフンが含まれていれば購入できない' do
      end
    end
  end
end
