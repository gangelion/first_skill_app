require 'rails_helper'
feature 'user', type: :feature do
  given(:user) { create(:user) }
  feature 'メインページでプロフィールリンクを押した時' do
    background do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
    end
    scenario 'user_pathに遷移し各リンクが表示されること' do
      click_on('プロフィール')
      expect(current_path).to eq user_path(user)
      expect(page).to have_selector 'img'
      expect(page).to have_link('投稿しているプラン')
      expect(page).to have_link('プロフィールを編集する')
      expect(page).to have_link('退会する')
    end
  end

  feature '投稿しているプランを押した時' do
    background do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
      click_on('プロフィール')
    end
    scenario 'プラン一覧画面に遷移すること' do
      click_on('投稿しているプラン')
      expect(current_path).to eq plans_path
    end
  end

  feature 'プロフィールを編集するを押した時' do
    background do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
      click_on('プロフィール')
      click_on('プロフィールを編集する')
    end
    scenario 'プロフィール編集画面に遷移すること' do
      expect(current_path).to eq edit_user_path(user)
    end
    scenario 'プロフィールが編集できること' do
      fill_in 'user_name', with: "ユーザーネームを編集しました"
      fill_in 'user_introduce', with: "自己紹介を編集しました"
      click_on('保存する')
      expect(current_path).to eq users_path
      expect(page).to have_content('ユーザー情報を更新しました')
      click_on('プロフィール')
      expect(page).to have_content('ユーザーネームを編集しました')
    end
  end

  feature '退会するを押した時' do
    background do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
      click_on('プロフィール')
      click_on('退会する')
    end
    scenario '退会確認画面に遷移すること' do
      expect(current_path).to eq delete_confirm_user_path(user)
    end
    scenario '退会確認画面からプラン作成画面に遷移できること' do
      click_on('プランを登録')
      expect(current_path).to eq new_plan_path
    end
    scenario '退会確認画面からメンター一覧画面に遷移できること' do
      click_on('メンターを探す')
      expect(current_path).to eq all_mentor_plans_path
    end
    scenario '退会(ユーザー削除)ができること' do
      click_button('退会する')
      expect(page).to have_content('退会するボタンを押すと全てのデータが削除されます')
      click_link('退会する')
      expect(page).to have_content('データの削除が完了しました')
      click_on('トップへ戻る')
      expect(current_path).to eq root_path
    end
  end
  feature '設定を押した時' do
    background do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
      click_on('設定')
    end
    scenario 'ユーザー編集画面に遷移すること' do
      expect(current_path).to eq edit_user_path(user)
    end
    scenario 'ユーザー編集画面に値が保持されていること' do
      expect(page).to have_field with: 'test'
    end
  end
end
