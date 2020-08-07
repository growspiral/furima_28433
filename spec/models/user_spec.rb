require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "同じemailは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれていなければ登録できない" do
      @user.email = "aaaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以上でなければ登録できない" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でないと登録できない" do
      @user.password ="aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end
    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "frist_nameが全角でなければ登録できない" do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "last_nameが全角でなければ登録できない" do
      @user.last_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "first_kanaが空だと登録できない" do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end
    it "last_kanaが空だと登録できない" do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "first_kanaがカタカナでなければ登録できない" do
      @user.first_kana = "ああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana カタカナを使用してください")
    end
    it "last_kanaがカタカナでなければ登録できない" do
      @user.last_kana = "ああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana カタカナを使用してください")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

end
