require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品が出品できる時" do
      it "item_image,item_name,item_info,item_category_id,item_sales_status_id,item_shipping_fee_status_id,prefecture_id,item_schedule_delivery_id,item_priceが存在すると出品できる" do
        expect(@item).to be_valid
      end
      context "商品が出品できない時" do
        it "item_nameが存在しないと出品できない" do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it "item_infoが存在しないと出品できない" do
          @item.item_info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item info can't be blank")
        end
        it "item_category_idが存在しないと出品できない" do
          @item.item_category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category can't be blank")
        end
        it "item_sales_status_idが存在しないと出品できない" do
          @item.item_sales_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item sales status can't be blank")
        end
        it "item_shipping_fee_idが存在しないと出品できない" do
          @item.item_shipping_fee_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
        end
        it "prefecture_idが存在しないと出品できない" do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "item_schedule_delivery_idが存在しないと出品できない" do
          @item.item_schedule_delivery_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item schedule delivery can't be blank")
        end
        it "item_priceが存在しないと出品できない" do
          @item.item_price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price can't be blank")
        end
        it "item_priceは¥300以上でないと出品できない" do
          @item.item_price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
        end
        it "item_priceは¥9,999,999以下でないと出品できない" do
          @item.item_price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
        end
        it "item_priceは半角数値でないと出品できない" do
          @item.item_price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price is not a number")
        end
        it "item_nameは40文字以内でないと出品できない" do
          @item.item_name = Faker::Lorem.characters(number: 41)
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
        end
        it "item_infoは1000文字以内でないと出品できない" do
          @item.item_info = Faker::Lorem.characters(number: 1001)
          @item.valid?
          expect(@item.errors.full_messages).to include("Item info is too long (maximum is 1000 characters)")
        end
      end
    end
  end
end
