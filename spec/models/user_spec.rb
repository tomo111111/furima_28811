require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_reading、first_name_redading、birthday が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは@が含まれていなければ登録できない" do
        @user.email = "aabbccddeeffgg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字混合であっても5文字以下であれば登録できない" do
        test = "12a45"
        @user.password = test
        @user.password_confirmation = test
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが6文字以上でも数字だけでは登録できない" do
        test = "123456"
        @user.password = test
        @user.password_confirmation = test
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが6文字以上でも英字だけでは登録できない" do
        test = "abcdef"
        @user.password = test
        @user.password_confirmation = test
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_name_readingが空では登録できない" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "first_name_readingが空では登録できない" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "last_name_readingが全角（カタカナ）でなければ登録できない" do
        @user.last_name_reading = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
      end
      it "first_name_readingが全角（カタカナ）でなければ登録できない" do
        @user.first_name_reading = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
