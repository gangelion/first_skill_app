FactoryBot.define do
  factory :plan do
    title	      {"testタイトルです"}
    description {"プランのテストを記入しました"}
    plan_image	{"hoge.png"}
    price	      {1000}
    user
  end
end
