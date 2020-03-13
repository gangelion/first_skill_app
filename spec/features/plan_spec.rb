require 'rails_helper'
feature 'plan', type: :feature do
	given(:user) { create(:user) }
	given(:plan) { create(:plan) }
  scenario 'ログインからプラン投稿、編集、削除まで' do
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
			fill_in 'formTagInput', with: 'HTML'
			fill_in 'plan_description', with: 'テストです。'
      fill_in 'plan_price', with: 1000
      click_on '登録する'
    }.to change(Plan, :count).by(1)
    expect(current_path).to eq users_path
		expect(page).to have_selector('.user__name_link')
		# プラン一覧確認
		click_link('投稿したプラン')
		expect(current_path).to eq plans_path
		find(".plan__show_link_title").click
		expect(current_path).to eq plan_path("#{plan.id - 1}")
		# プラン編集
		click_link('プランを編集する')
		expect(current_path).to eq edit_plan_path("#{plan.id - 1}")
		fill_in 'plan_title', with: 'プランタイトルを編集しました'
		fill_in 'formTagInput', with: 'Ruby'
		fill_in 'plan_description', with: 'プラン説明を編集しました'
		fill_in 'plan_price', with: 10000
		click_on('保存する')
		expect(page).to have_content('プランタイトルを編集しました')
		click_on('プランタイトルを編集しました')
		expect(page).to have_content('プランタイトルを編集しました')
		expect(page).to have_link('Ruby')
		expect(page).to have_content('プラン説明を編集しました')
		expect(page).to have_content(10000)
		# プラン削除
		click_link('プランを編集する')
		click_on('削除する')
		expect(page).to have_content('プランを削除しました')
  end
	feature 'プラン一覧の確認' do
		scenario 'プランがない時はプランが表示されない' do
			visit new_user_session_path
			fill_in 'user_email', with: user.email
			fill_in 'user_password', with: user.password
			find(".login__main_btn").click
			click_link('投稿したプラン')
			expect(current_path).to eq plans_path
			expect(page).to have_no_link(".plan__show_link")
			expect(page).to have_no_selector(".plan__show_link")
		end
	end
end
