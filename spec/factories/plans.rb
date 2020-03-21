FactoryBot.define do
  factory :plan do
    title { "testタイトルです" }
    description { "プランのテストを記入しました" }
    plan_image { "hoge.png" }
    price { 1000 }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
