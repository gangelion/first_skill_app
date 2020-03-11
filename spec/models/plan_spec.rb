require 'rails_helper'

describe Plan do
  describe '#create' do
    it "is valid with title, description, price" do
      plan = build(:plan)
      expect(plan).to be_valid
    end

    it "is invalid without a title" do
      plan = build(:plan, title: "") 
      plan.valid?
      expect(plan.errors[:title]).to include("を入力してください")
    end

    it "is invalid with a title that has more than 9 characters" do
      plan = build(:plan, title: "t" * 9) 
      plan.valid?
      expect(plan.errors[:title]).to include("は10文字以上で入力してください")
    end

    it "is valid with a title that has more than 10 characters" do
      plan = build(:plan, title: "t" * 10) 
      expect(plan).to be_valid
    end

    it "is valid with a title that has less than 80 characters" do
      plan = build(:plan, title: "t" * 80) 
      expect(plan).to be_valid
    end

    it "is invalid with a title that has more than 81 characters" do
      plan = build(:plan, title: "t" * 81) 
      plan.valid?
      expect(plan.errors[:title]).to include("は80文字以内で入力してください")
    end
    
    it "is invalid without a description" do
      plan = build(:plan, description: "") 
      plan.valid?
      expect(plan.errors[:description]).to include("を入力してください")
    end
 
    it "is invalid with a description that has more than 2001 characters" do
      plan = build(:plan, description: "t" * 2001)
      plan.valid?
      expect(plan.errors[:description]).to include("は2000文字以内で入力してください")
    end
    
    it "is valid with a description that has less than 2000 characters" do
      plan = build(:plan, description: "t" * 2000)
      expect(plan).to be_valid
    end

    it "is invalid without a price" do
      plan = build(:plan, price: "")
      plan.valid?
      expect(plan.errors[:price]).to include("を入力してください")
    end

    it "is invalid with a price that has less than 999 yen" do
      plan = build(:plan, price: 999)
      plan.valid?
      expect(plan.errors[:price]).to include("は1000以上の値にしてください")
    end

    it "is valid with a price that has more than 1000 yen" do
      plan = build(:plan, price: 1000)
      expect(plan).to be_valid
    end

    it "is valid with a price that has less than 1000000 yen" do
      plan = build(:plan, price: 1000000)
      expect(plan).to be_valid
    end

    it "is invalid with a price that has more than 1000001 yen" do
      plan = build(:plan, price: 1000001)
      plan.valid?
      expect(plan.errors[:price]).to include("は1000000以下の値にしてください")
    end

    it "is invalid if not an integer" do
      plan = build(:plan, price: "test")
      plan.valid?
      expect(plan.errors[:price]).to include("は数値で入力してください")
    end
    
  end
end
