require 'rails_helper'

describe UserPurchase, type: :model do
  before do
    @buyer = FactoryBot.build(:user_purchase)
    @seller = FactoryBot.build(:item).user
    
  end
  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '必須項目が存在すれば購入できる' do
        expect(@buyer).to be_valid
      end

      it '郵便番号にハイフンを含んでいれば購入できる' do
        @buyer.postal_code = '222-2222'
        expect(@buyer).to be_valid
      end
      it '電話番号にハイフンが含まれず、11けた以内の数字であれば購入できる' do
        @buyer.phone = '0802222222'
        expect(@buyer).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it '郵便番号が空だと購入できない' do
        @buyer.postal_code = nil
        @buyer.valid?

        expect(@buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空だと購入できない' do
        @buyer.prefecture_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が--だと購入できない' do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @buyer.city = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @buyer.block_num = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Block num can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @buyer.phone = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone can't be blank")
      end
      it '郵便番号にハイフンが含まれていなければ購入できない' do
        @buyer.postal_code = '1112222'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Postal code -(ハイフン)を含めて入力してください')
      end
      it '電話番号にハイフンが含まれていれば購入できない' do
        @buyer.phone = '080-2222-22'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone -(ハイフン)を含めず入力してください')
      
    
      end
    end
  end
end
