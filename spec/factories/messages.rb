FactoryBot.define do
  factory :message do
    content { "テストメッセージです" }
    user
    association :sender, factory: :user
  end
end
