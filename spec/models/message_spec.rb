require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a content" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a content" do
      message = build(:message, content: "")
      message.valid?
      expect(message.errors[:content]).to include("を入力してください。")
    end

    it "is invalid with a content that has more than 2001 characters" do
      message = build(:message, content: "t" * 2001)
      message.valid?
      expect(message.errors[:content]).to include("は2000文字以内で入力してください。")
    end

    it "is valid with a content that has less than 2000 characters" do
      message = build(:message, content: "t" * 2000)
      expect(message).to be_valid
    end
  end
end
