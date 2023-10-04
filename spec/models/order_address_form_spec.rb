require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@order_address_form).to be_valid
    end

    it 'building_nameが空でも保存できる' do
      @order_address_form.building_name = ''
      expect(@order_address_form).to be_valid
    end

  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できない' do
      @order_address_form.postal_code = ''
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できない' do
      @order_address_form.postal_code = '1234567'
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it 'shipping_region_idが空だと保存できない' do
      @order_address_form.shipping_region_id = nil
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Shipping region can't be blank")
    end

    it 'shipping_region_idが1だと保存できない' do
      @order_address_form.shipping_region_id = 1
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Shipping region can't be blank")
    end

    it 'cityが空だと保存できない' do
      @order_address_form.city = ''
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("City can't be blank")
    end

    it 'street_addressが空だと保存できない' do
      @order_address_form.street_address = ''
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Street address can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @order_address_form.phone_number = ''
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁未満だと保存できない' do
      @order_address_form.phone_number = '123456789'
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Phone number is invalid. Input only number", "Phone number is too short")
    end

    it 'phone_numberが11桁より多いと保存できない' do
      @order_address_form.phone_number = '123456789012'
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Phone number is invalid. Input only number", "Phone number is too short")
    end

    it 'phone_numberが半角数値でないと保存できない' do
      @order_address_form.phone_number = '０９０１２３４５６７８'
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it 'user_idが空だと保存できない' do
      @order_address_form.user_id = nil
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと保存できない' do
      @order_address_form.item_id = nil
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空だと保存できない' do
      @order_address_form.token = nil
      @order_address_form.valid?
      expect(@order_address_form.errors.full_messages).to include("Token can't be blank")
    end
  end
end