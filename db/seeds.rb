User.create!(id: 1, name: "test", email: "test@test", password: "11111111", created_at: "2020-01-01", updated_at: "2020-01-10")
Plan.create!(id: 1, title: "testplantestplan", description: "testdescription", plan_image: "https://cdn.pixabay.com/photo/2017/04/24/11/18/drop-of-water-2256201__480.jpg" , price: 1000, user_id: 1, created_at: "2020-01-01", updated_at: "2020-01-10")
Skill.create([{ skill_set: "HTML/CSS"},
              { skill_set: "Ruby"},
              { skill_set: "JavaScript"},
              { skill_set: "Python"},
              { skill_set: "PHP"},
              { skill_set: "Java"},
              { skill_set: "SQL"},
              { skill_set: "その他"}
            ])