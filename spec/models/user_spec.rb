require 'rails_helper'

describe User do
  describe '#create' do
    it "1.全ての入力が満たされていれば登録ができる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "2.nicknameが空では登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームを入力してください")
    end

    it "3.nicknameが20文字以上では登録できない" do
      user = build(:user, nickname: "abcdefghijklmnopqrstuvwxyz")
      user.valid?
      expect(user.errors[:nickname]).to include("20文字以内で入力してください")
    end

    it "4.emailが空では登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("入力してください")
    end

    it "5.重複したemailが存在していると登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "6.emailが正しくないと登録できない" do
      user = build(:user, email: "1234")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    
    it "7.passwordが空だと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("入力してください", "パスワードを入力してください", "6文字以上で入力してください")
    end
    
    it "8.passwordが6文字未満だと登録できない" do
      user = build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("6文字以上で入力してください")
    end

    it "9.passwordが10文字以上だと登録できない" do
      user = build(:user, password: "abcdefghijklm")
      user.valid?
      expect(user.errors[:password]).to include("10文字以内で入力してください")
    end

    it "10.nicknameが空では登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームを入力してください")
    end

    it "11.lastnameが空では登録できない" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("姓を入力してください")
    end

    it "12.firstnameが空では登録できない" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("名を入力してください")
    end

    it "13.lastnamekanaが空では登録できない" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("姓カナを入力してください")
    end

    it "14.firstnamekanaが空では登録できない" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("名カナを入力してください")
    end

    it "15.birthdayが空では登録できない" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("生年月日を入力してください")
    end

    it "16.birthdayの西暦が空では登録できない" do
      user = build(:user, birthday: "05-05")
      user.valid?
      expect(user.errors[:birthday]).to include("生年月日を入力してください")
    end

    it "17.birthdayの月,日が空では登録できない" do
      user = build(:user, birthday: "2019")
      user.valid?
      expect(user.errors[:birthday]).to include("生年月日を入力してください")
    end

    it "18.チェックボックスの入力が空だと登録できない" do
      user = build(:user, agreement:nil)
      user.valid?
      expect(user.errors[:agreement]).to include("選択してください")
    end

    it "19.電話番号の入力が空だと登録できない" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("会員登録できません", "10文字以上で入力してください")
    end

    it "20.電話番号が10桁未満だと入力が登録できない" do
      user = build(:user, phone_number: "123456789")
      user.valid?
      expect(user.errors[:phone_number]).to include("10文字以上で入力してください")
    end

    it "21.電話番号が12桁以上だと入力が登録できない" do
      user = build(:user, phone_number: "123456789012")
      user.valid?
      expect(user.errors[:phone_number]).to include("11文字以内で入力してください")
    end
  end
end