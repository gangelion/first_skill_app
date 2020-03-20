FactoryBot.define do
  factory :skill do
    skill_set { "HTML/CSS" }
    trait "HTML/CSS" do
      id        { 1 }
      skill_set { "HTML/CSS" }
    end
    trait "Ruby" do
      id        { 2 }
      skill_set { "Ruby" }
    end
    trait "JavaScript" do
      id        { 3 }
      skill_set { "JavaScript" }
    end
    trait "Python" do
      id        { 4 }
      skill_set { "Python" }
    end
    trait "PHP" do
      id        { 5 }
      skill_set { "PHP" }
    end
    trait "Java" do
      id        { 6 }
      skill_set { "Java" }
    end
    trait "SQL" do
      id        { 7 }
      skill_set { "SQL" }
    end
    trait "その他" do
      id        { 8 }
      skill_set { "その他" }
    end
  end
end
