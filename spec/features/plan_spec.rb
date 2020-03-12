require 'rails_helper'
feature 'plan', type: :feature do
	given(:user) { create(:user) }
  scenario 'ログインからプラン投稿まで' do
		visit root_path
		expect(page).to have_content('First Skill App')
		expect(page).to have_content('ログイン')
		expect(page).to have_content('無料登録')
		expect(page).to have_no_content('ログアウト')
		expect(page).to have_no_content('HOME')
		# ログイン処理
		visit new_user_session_path
		fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find(".login__main_btn").click
		expect(current_path).to eq users_path
		expect(page).to have_no_content('First Skill App')
		expect(page).to have_no_content('ログイン')
		expect(page).to have_no_content('無料登録')
		expect(page).to have_content('HOME')
		expect(page).to have_content('ログアウト')
		# プラン作成
		expect {
			click_link('メンタープランの登録はこちら')
			expect(current_path).to eq new_plan_path
			fill_in 'plan_title', with: 'テストタイトルです。'
			fill_in 'plan_description', with: 'テストです。'
      fill_in 'plan_price', with: 1000
      click_on '登録する'
    }.to change(Plan, :count).by(1)
    expect(current_path).to eq users_path
    expect(page).to have_selector('.user__name_link')
  end

end
