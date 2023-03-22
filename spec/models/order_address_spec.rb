require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address =FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context "内容に問題ない場合" do
      it "token,postal_code,prefecture_id,city,address,building,phone_numberが正しく入力されていれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "buildingが空でも購入できる" do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "tokenが空では保存できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと保存できない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが「3桁ハイフン4桁」の文字列でないと保存できない" do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが半角文字列でないと保存できない" do
        @order_address.postal_code = '１２３−１２３４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが未選択のままだと保存できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空だと保存できない" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと保存できない" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと保存できない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9桁以下だと保存できない" do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上だと保存できない" do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが半角数値でないと保存できない" do
        @order_address.phone_number = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
