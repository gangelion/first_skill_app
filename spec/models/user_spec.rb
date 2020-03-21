require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください。")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が一致しません。")
    end

    it "is invalid with a name that has more than 21 characters" do
      user = build(:user, name: "a" * 21)
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください。")
    end

    it "is valid with a name that has less than 20 characters" do
      user = build(:user, name: "a" * 20)
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "is invalid with a introduce that has more than 501 characters" do
      user = build(:user, introduce: "a" * 501)
      user.valid?
      expect(user.errors[:introduce]).to include("は500文字以内で入力してください。")
    end

    it "is valid with a introduce that has less than 500 characters" do
      user = build(:user, introduce: "a" * 500)
      expect(user).to be_valid
    end
  end
end
