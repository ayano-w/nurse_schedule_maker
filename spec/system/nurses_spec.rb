require 'rails_helper'

RSpec.describe "Nurses", type: :system do
  let(:nurse){create(:nurse)}
  let(:other_nurse){create(:nurse)}
  before do
    driven_by(:rack_test)
  end

  describe 'Nurse CRUD' do
    describe 'ログイン前' do
      describe '看護師新規登録 ' do

        context 'フォームの入力値が正常' do
          it '看護師の新規登録が成功' do
            visit new_nurse_registration_path
            fill_in '名前', with: nurse.name
            fill_in 'パスワード', with: nurse.password
            click_button '新規登録'
            # expect(current_path).to eq　top_path　
            expect(page).to have_content 'アカウント登録に成功しました。'
          end
        end

        context '名前未記入' do
          it '看護師の新規登録が失敗' do
            visit new_nurse_registration_path
            fill_in '名前', with: nil
            fill_in 'パスワード', with: nurse.password
            click_button '新規登録'
            expect(current_path).to eq new_nurse_registration_path
            expect(page).to have_content 'はすでに存在します'
          end
        end

        context '登録済み名前' do
        end
      end

    end

    describe 'ログイン後' do
      describe '看護師編集' do
        context 'フォームの入力値が正常' do
        end

        context '名前が未記入' do
        end
      end

    end
  end

end
