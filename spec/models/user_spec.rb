require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana が存在すれば登録できる' do
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
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'password' # 半角英字のみのパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    
        @user.password = '123456' # 半角数字のみのパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    
        @user.password = 'パスワード' # 全角文字のパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'password'
        @user.password_confirmation = 'differentpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'Smith' # 半角文字を含む名字
        @user.first_name = 'John' # 半角文字を含む名前
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'すみす' # ひらがなを含む名字カナ
        @user.first_name_kana = 'じょん' # ひらがなを含む名前カナ
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
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
