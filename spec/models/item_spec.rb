require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '商品が新規登録ができる時' do
      it '全項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品名が新規登録ができない時' do
      it'商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it'商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it'商品の状態についての情報' do
        @item.info_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info is not a number")
      end
      it'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it'商品の状態についての情報が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it'配送料の負担についての情報が必須であること' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it'発送元の地域についての情報が必須であること' do
        @item.prefecture_id= ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it'発送までの日数についての情報が必須であること' do
        @item.schedule_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Schedule can't be blank", "Schedule is not a number")
      end
      it'販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it'販売価格は299円以下では保存ができない' do
        @item.price = '299'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it'販売価格は10000000円以上では保存ができない' do
        @item.price = '10000000'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it'販売価格は半角数字のみ保存可能であること' do
        @item.price = 'TTT'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      end
    end
  end
end