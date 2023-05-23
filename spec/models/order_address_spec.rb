require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item,user_id:@user.id)
      @order_address = FactoryBot.build(:order_address,user_id:@user.id,item_id:@item.id)
      sleep 0.5
    end
    context '商品購入記録の保存できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入記録の保存できない場合' do
      it '郵便番号は空では保存できないこと' do
        @order_address.post_code=""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @order_address.post_code=00000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @order_address.shipping_area_id=1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order_address.municipalities=nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order_address.block_number=nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @order_address.phone_number=nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order_address.phone_number=000000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと購入できないこと' do
        @order_address.phone_number=000000000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できないこと' do
        @order_address.token=nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @order_address.item_id=nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @order_address.user_id=nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
       it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.phone_number='０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
       end
      
    end
  end
end

