1.upto(30) do |i|
  User.create!(id: i,
               email: "test@#{i}",
               password: "11111111",
               name: "test#{i}",
               introduce: "テストプレイ#{i}です",
               created_at: "2020-01-0#{i}")
end

1.upto(20) do |i|
  Plan.create!(id: i,
               title: "テスト#{i}のタイトルです。",
               description: "プラン#{i}のテストを記入しました",
               price: "#{i}000",
               user_id: i,
               created_at: "2020-01-0#{i}")
end

Skill.create!([{ skill_set: "HTML/CSS" },
               { skill_set: "Ruby" },
               { skill_set: "JavaScript" },
               { skill_set: "Python" },
               { skill_set: "PHP" },
               { skill_set: "Java" },
               { skill_set: "SQL" },
               { skill_set: "その他" }])

1.upto(8) do |i|
  PlanSkillTag.create!(id: i,
                       plan_id: i,
                       skill_id: i)
end

1.upto(15) do |i|
  Message.create!(id: i,
                  content: "メッセージ#{i}のテストを記入しました",
                  user_id: i,
                  sender_id: i + 1,
                  created_at: "2020-01-0#{i}")
end

1.upto(15) do |i|
  Article.create!(id: i,
                  title: "記事#{i}のテストタイトルを記入しました",
                  content: "記事#{i}のテストコンテントを記入しました",
                  user_id: i,
                  created_at: "2020-01-0#{i}")
end
