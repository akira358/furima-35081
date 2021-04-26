require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:orders_address, user_id:user.id, item_id:item.id)
    sleep(1)
  end

  describe '購入の新規登録' do
    context '購入の新規登録ができる時' do
      it '全項目が入力されていれば登録できる' do  
        expect(@order).to be_valid
      end
      it '建物名が空でも登録できる' do  
        @order.build =''
        expect(@order).to be_valid
      end
    end

    context '購入することが出来ない時' do
      it'配送先の郵便番号が必須である' do
        @order.postal_code =''
        @order.valid?        
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it'配送先の都道府県は必須である' do
        @order.prefecture_id =''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it'prefecture_idが1であるとき登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it'配送先の市区町村は必須である' do
        @order.city =''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it'配送先の番地が必須である'do
        @order.street =''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street can't be blank")
      end
      it'配送先の電話番号が必須である'do
      @order.phone_number =''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
     end
     it'郵便番号にはハイフンが必須である'do
     @order.postal_code = 1234567
       @order.valid?
       expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
     it'電話番号は12桁以上の番号は登録できない'do
     @order.phone_number = 123456789012
       @order.valid?
       expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it'電話番号が英数混合だと登録できない' do
      @order.phone_number = 'a2'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is not a number")
    end
    it'電話番号が全角だと登録できない' do
      @order.phone_number = '１０００'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is not a number")
    end
    it'user_idは必須である' do
      @order.user_id =''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it'item_idは必須である' do
      @order.item_id =''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it'tokenは必須である' do
      @order.token =''
      @order.valid?
      binding.pry
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    end
  end
end