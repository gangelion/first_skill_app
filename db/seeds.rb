1.upto(10) do |i|
  User.create(id: i,
              email: "test@#{i}",
              password: "11111111",
              name: "test#{i}",
              # image_icon: open("#{Rails.root}/public/uploads/user/image_icon/1/0b7e6270924187aed96a8f8c5ae37c63.jpg"),
              introduce: "テストプレイ#{i}です")
end

1.upto(5) do |i|
  Plan.create(id: i,
              title: "テスト#{i}のタイトルです。",
              description: "プラン#{i}のテストを記入しました",
              # plan_image: open("#{Rails.root}/public/uploads/plan/plan_image/1/ダウンロード.png"),
              price: "#{i}000",
              user_id: i)
end

Skill.create([{ skill_set: "HTML/CSS" },
              { skill_set: "Ruby" },
              { skill_set: "JavaScript" },
              { skill_set: "Python" },
              { skill_set: "PHP" },
              { skill_set: "Java" },
              { skill_set: "SQL" },
              { skill_set: "その他" }])
