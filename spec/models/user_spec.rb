require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "emailに一意性がないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "emailが@を含んでいないと登録できない" do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordは6文字以上でないと登録できない" do
      @user.password = '1111q'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passwordは半角英数字混合でないと登録できない" do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password_confirmation = '1111qq'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid" 
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "last_name_kanaは全角（カタカナ）でないと登録できない" do
      @user.last_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it "first_name_kanaは全角（カタカナ）でないと登録できない" do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it "birth_dateが空だと登録できない" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end
