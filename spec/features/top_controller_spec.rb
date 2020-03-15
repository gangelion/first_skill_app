require 'rails_helper'
feature 'top', type: :feature do
  given(:user) { create(:user) }
  background {
    visit root_path
  }
  feature 'ユーザー登録をするを押した時' do
    scenario 'サインアップ画面に遷移すること' do
      find('.first_registration_link').click
      expect(current_path).to eq new_user_registration_path
    end
    scenario 'ユーザー登録ができること' do
      expect {
        find('.second_registration_link').click
        fill_in 'user_name', with: user.name
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password_confirmation
        click_on('登録する')
      }.to change(User, :count).by(1)
      click_on('ログイン')
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button('ログイン')
      expect(current_path).to eq users_path
    end
  end
  feature '無料登録を押した時' do
    scenario 'サインアップ画面に遷移すること' do
      click_on('無料登録')
      expect(current_path).to eq new_user_registration_path
    end
  end
  feature 'メンターとして登録したい方はこちらを押した時' do
    scenario 'メンタートップ画面に遷移すること' do
      click_on('メンターとして登録したい方はこちら')
      expect(current_path).to eq top_path
    end
  end
  feature 'スキルボタンを押した時' do
    background {
      create(:skill, "HTML/CSS")
      create(:skill, "Ruby")
      create(:skill, "JavaScript")
      create(:skill, "Python")
      create(:skill, "PHP")
      create(:skill, "Java")
      create(:skill, "SQL")
      create(:skill, "その他")
    }
    context 'スキルに紐づくプランがない時' do
      scenario '意図したスキル一覧に遷移すること' do
        click_on('HTML/CSS')
        expect(page).to have_content('HTML/CSS')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('Ruby')
        expect(page).to have_content('Ruby')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('JavaScript')
        expect(page).to have_content('JavaScript')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('Python')
        expect(page).to have_content('Python')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('PHP')
        expect(page).to have_content('PHP')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('Java')
        expect(page).to have_content('Java')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('SQL')
        expect(page).to have_content('SQL')
        expect(page).to have_content('見つかりませんでした')
        click_on('First Skill App')
        click_on('その他')
        expect(page).to have_content('その他')
        expect(page).to have_content('見つかりませんでした')
      end
    end
    context 'スキルに紐づくプランがある時' do
      given(:plan) { create(:plan) }
      background {
        create(:plan_skill_tag, skill_id: 1, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 2, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 3, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 4, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 5, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 6, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 7, plan_id: plan.id)
        create(:plan_skill_tag, skill_id: 8, plan_id: plan.id)
      }
      scenario 'スキルに紐づくメンター(プラン)が表示されること' do
        visit root_path
        click_on('HTML/CSS')
        expect(page).to have_content('HTML/CSS')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('Ruby')
        expect(page).to have_content('Ruby')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('JavaScript')
        expect(page).to have_content('JavaScript')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('Python')
        expect(page).to have_content('Python')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('PHP')
        expect(page).to have_content('PHP')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('Java')
        expect(page).to have_content('Java')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('SQL')
        expect(page).to have_content('SQL')
        expect(page).to have_content('1人のメンターがみつかりました')
        click_on('その他')
        expect(page).to have_content('その他')
        expect(page).to have_content('1人のメンターがみつかりました')
      end
    end    
  end
  feature '表示されているメンターのリンクを押した時' do
    scenario 'プラン詳細画面に遷移すること' do
    end
    scenario '機能が制限されること（フォローできない、メッセージが送れない、プランが編集できない）' do
    end
  end
  feature 'メンターを探すを押した時' do
    scenario 'メンター一覧画面に遷移すること' do
    end
  end
end
