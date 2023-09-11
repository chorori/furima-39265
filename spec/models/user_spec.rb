require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.example.com' # @を含まない例
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345' # 5文字以下の例
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)"
      end

      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it 'パスワードが全角英数字混合では登録できない' do
        @user.password = '１２３Abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは、値の一致が必須であること' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワード（確認）は、値の一致が必須であること' do
        @user.password_confirmation = 'differentpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'Smith' # 半角文字を含む名字
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'John' # 半角文字を含む名前
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it '名字カナ(全角)は、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it '名前カナ(全角)は、名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it '名字カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'すみす' # ひらがなを含む名字カナ
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'じょん' # ひらがなを含む名前カナ
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      it '生年月日が必須であること' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthdate can't be blank"
      end

    end

  end
end
