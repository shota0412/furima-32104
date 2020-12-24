require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入者情報の保存' do
    context '購入者情報の保存がうまく行く時' do
      it '全ての項目に正しく入力されていれば登録できる' do
        expect(@order_address).to be_valid
      end
    end
    context '購入者情報の保存がうまくいかない時' do
      it '郵便番号が空だと購入ができない' do
        @order_address.zip = ""
        @order_address.valid?
        expect(@order_address.errors.messages).to include(:zip => ["can't be blank", "is the wrong length (should be 8 characters)", "is invalid"])
      end
      it '郵便番号にハイフンがないと登録できない' do
        @order_address.zip = "12345678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip is invalid")
      end
      it '郵便番号が8桁でないと購入できない' do
        @order_address.zip = "123-458"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空だと購入できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁でなければ購入できない' do
        @order_address.phone_number = "090111122223333"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
