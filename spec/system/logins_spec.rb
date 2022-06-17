require 'rails_helper'

RSpec.describe "ログイン", type: :system do
  let(:user) { create(:user) }
  describe 'ログイン機能' do
    context '入力情報に誤りがある場合' do
      it 'エラーメッセージが表示されること' do
        visit '/login'
        within '#login-form' do
          fill_in 'メールアドレス', with: 'wrong@example.com'
          fill_in 'パスワード', with: 'password'
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインに失敗しました'
      end
    end

    context '入力情報が正しい場合' do
      it 'ログインできること' do
        visit '/login'
        within '#login-form' do
          visit '/login'
          fill_in 'メールアドレス', with: user.email
          fill_in 'パスワード', with: 'password'
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインしました'
      end
    end
  end

  describe 'ログアウト機能' do
    before do
      login_as(user)
    end

    it 'ログアウトできること' do
      find("#header-avatar-dropdown").click
      accept_confirm { click_on 'ログアウト' }
      expect(page).to have_content 'ログアウトしました'
    end
  end

  describe 'ヘッダーメニューの表示/非表示' do
    context 'ログインしているとき' do
      before do
        login_as(user)
      end

      it 'メニューの表示が適切であること' do
        visit '/'
        within '#header' do
          expect(page).not_to have_link 'ログイン', href: '/login'
          expect(page).not_to have_link 'サインアップ', href: '/signup'
          expect(page).to have_css '#header-avatar-dropdown'
        end
      end
    end

    context '未ログインのとき' do
      it 'メニューの表示が適切であること' do
        visit '/'
        within '#header' do
          expect(page).to have_link 'ログイン', href: '/login'
          expect(page).to have_link 'サインアップ', href: '/signup'
          expect(page).not_to have_css '#header-avatar-dropdown'
        end
      end
    end
  end
end
