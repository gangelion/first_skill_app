require 'rails_helper'
feature 'message', type: :feature do
  given(:user) { create(:user) }
  given(:message) { create(:message) }
  given(:plan) { create(:plan) }
  given(:plans) { create_list(:plan, 5) }
  feature 'メッセージを作成する' do
    scenario 'メッセージが作成できること' do
      plan
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
      click_link('testタイトルです')
      expect(current_path).to eq plan_path(plan)
      expect(page).to have_content('メッセージで相談')
      click_button('メッセージで相談')
      fill_in 'content', with: message.content
      click_on('メッセージを送信する')
      expect(current_path).to eq users_path
    end
  end
  feature 'メッセージを確認する' do
    background do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find(".login__main_btn").click
    end
    scenario 'user_messages_pathに遷移すること' do
      click_link('メッセージ')
      expect(current_path).to eq user_messages_path(user)
    end
    context 'メッセージがあった場合' do
      given(:receive_message) { create(:message, user_id: user.id, content: "送信テスト") }
      scenario 'メッセージが確認でき、返信ができること' do
        receive_message
        click_link('メッセージ')
        expect(current_path).to eq user_messages_path(user)
        expect(page).to have_content('件のメッセージが見つかりました。')
        expect do
          click_on('確認する')
          expect(current_path).to eq user_message_path(user.id, receive_message.id)
          fill_in 'content', with: message.content
          click_on('返信する')
          expect(current_path).to eq users_path
        end.to change(Message, :count).by(2)
      end
    end
    context 'メッセージがなかった場合' do
      scenario '見つかりませんでした。と表示されること' do
        click_link('メッセージ')
        expect(page).to have_content('見つかりませんでした。')
      end
    end
  end
end
