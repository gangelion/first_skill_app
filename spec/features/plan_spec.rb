require 'rails_helper'
feature 'plan', type: :feature do
	given(:user) { create(:user) }
	given(:plan) { create(:plan) }
	given(:plans) { create_list(:plan, 5) }
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
		expect(page).to have_no_link('ログイン')
		expect(page).to have_no_content('無料登録')
		expect(page).to have_content('HOME')
		expect(page).to have_link('ログアウト')
		# プラン作成
		expect {
			click_link('メンタープランの登録はこちら')
			expect(current_path).to eq new_plan_path
			fill_in 'plan_title', with: 'テストタイトルです。'
			fill_in 'formTagInput', with: 'HTML'
			fill_in 'plan_description', with: 'テストです。'
      fill_in 'plan_price', with: 1000
			click_on('登録する')
    }.to change(Plan, :count).by(1)
    expect(current_path).to eq users_path
		expect(page).to have_selector('.user__name_link')
		expect(page).to have_content('プランを登録しました')
		# プラン一覧確認
		click_link('投稿したプラン')
		expect(current_path).to eq plans_path
		find(".plan__show_link_title").click
		expect(current_path).to eq plan_path("#{plan.id - 1}")
		# プラン編集
		click_link('プランを編集する')
		expect(current_path).to eq edit_plan_path("#{plan.id - 1}")
		fill_in 'plan_title', with: 'プランタイトルを編集しました'
		# fill_in 'formTagInput', with: 'Ruby'
		fill_in 'plan_description', with: 'プラン説明を編集しました'
		fill_in 'plan_price', with: 10000
		click_on('保存する')
		expect(page).to have_content('プランを更新しました')
		expect(page).to have_content('プランタイトルを編集しました')
		click_on('プランタイトルを編集しました')
		expect(page).to have_content('プランタイトルを編集しました')
		# expect(page).to have_link('Ruby')
		expect(page).to have_content('プラン説明を編集しました')
		expect(page).to have_content(10000)
		# プラン削除
		click_link('プランを編集する')
		click_on('削除する')
		expect(page).to have_content('プランを削除しました')
	end
	
	feature 'プラン一覧の確認' do
		scenario 'プランがない時はプランが表示されないこと' do
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

	feature '自分のプランを選択した時' do
		given(:own_plan) { create(:plan, user_id: user.id) }
		given(:others_plan) { Plan.create(id: plan.id, user_id: user.id + 1) }
		context '自分のプランを選択した場合' do
			background {
				own_plan
				visit new_user_session_path
				fill_in 'user_email', with: user.email
				fill_in 'user_password', with: user.password
				find(".login__main_btn").click
			}
			scenario 'メッセージで相談、フォローボタンが表示されないこと' do
				click_link('testタイトルです')
				expect(page).to have_no_button('メッセージで相談')
				expect(page).to have_no_button('フォローする')
			end
			scenario 'プランを編集するボタンが表示されること' do
				click_link('testタイトルです')
				expect(page).to have_link('プランを編集する')
			end
		end
		context '他人のプランを選択した場合' do
			background {
				others_plan
				visit new_user_session_path
				fill_in 'user_email', with: user.email
				fill_in 'user_password', with: user.password
				find(".login__main_btn").click
			}
			scenario 'メッセージで相談、フォローボタンが表示されること' do
				click_link('testタイトルです')
				expect(page).to have_button('メッセージで相談')
				expect(page).to have_button('フォローする')
			end
			scenario 'プランを編集するボタンが表示されないこと' do
				click_link('testタイトルです')
				expect(page).to have_no_link('プランを編集する')
			end
		end
  end

	feature '検索機能' do
		context 'プランが見つかった時' do
			scenario 'タイトルに紐づくメンターが表示されること' do
				plan
				visit root_path
				fill_in 'keyword', with: "test"
				click_on('検索')
				expect(page).to have_link('testタイトルです')
			end
			scenario 'タグに紐づくメンターが表示されること' do
				plan = create(:plan, title: "テストスキルのタイトル")
				skill = create(:skill, skill_set: "テストスキルのタグ")
				plan_skill_tag = create(:plan_skill_tag, skill_id: skill.id, plan_id: plan.id)
				visit root_path
				fill_in 'keyword', with: "テストスキルのタグ"
				click_on('検索')
				expect(page).to have_link('テストスキルのタイトル')
			end
			scenario '複数キーワード検索が可能なこと(空白も取り除けていること)' do
				plan = create(:plan, title: "テストスキルのタイトル", description: "説明を記入しました。")
				skill = create(:skill, skill_set: "HTML")
				plan_skill_tag = create(:plan_skill_tag, skill_id: skill.id, plan_id: plan.id)
				visit root_path
				fill_in 'keyword', with: "説明 HT　"
				click_on('検索')
				expect(page).to have_content('テストスキルのタイトル')
				fill_in 'keyword', with: "HTML テスト"
				click_on('検索')
				expect(page).to have_content('テストスキルのタイトル')
				fill_in 'keyword', with: " 　HTML 説明　テスト"
				click_on('検索')
				expect(page).to have_content('テストスキルのタイトル')
			end
		end
		context 'プランが見つからなかった時' do
			scenario '見つかりませんでしたと表示されること' do
				visit root_path
				fill_in 'keyword', with: "失敗"
				click_on('検索')
				expect(page).to have_content('見つかりませんでした。')
			end
		end
	end
	feature 'メンター表示機能' do
		scenario '総合と新着メンターが表示されること' do
			plans
			visit root_path
			click_link('メンターを探す')
			expect(current_path).to eq all_mentor_plans_path
			expect(page).to have_link('test')
			click_link('新着')
			plans.reverse
			expect(current_path).to eq new_arrival_mentor_plans_path
		end
	end
end
