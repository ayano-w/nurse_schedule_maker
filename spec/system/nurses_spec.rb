require 'rails_helper'

RSpec.describe "Nurses", type: :system do
  let!(:ward){create(:ward)}
  let(:nurse){build(:nurse, ward: ward)}
  let!(:other_nurse){create(:nurse, ward: ward)}

  describe 'Nurse CRUD' do
    describe 'ログイン前' do
      describe '看護師新規登録 ' do
        context 'フォームの入力値が正常' do
          it '看護師の新規登録が成功' do
            visit new_nurse_registration_path
            fill_in 'nurse[name]', with: nurse.name
            select ward.ward_name, from: '病棟'
            fill_in 'nurse[password]', with: nurse.password
            fill_in 'nurse[password_confirmation]', with: nurse.password
            click_button '新規登録'
            expect(current_path).to eq top_path
            expect(page).to have_content 'アカウント登録が完了しました。'
          end
        end

        context '看護師の新規登録が失敗' do
          it '名前未記入' do
            visit new_nurse_registration_path
            fill_in 'nurse[name]', with: nil
            fill_in 'nurse[password]', with: nurse.password
            fill_in 'nurse[password_confirmation]', with: nurse.password
            select ward.ward_name, from: '病棟'
            click_button '新規登録'
            expect(page).to have_content 'を入力してください'
          end
          it '登録済みの名前' do
            visit new_nurse_registration_path
            fill_in 'nurse[name]', with: other_nurse.name
            fill_in 'nurse[password]', with: nurse.password
            fill_in 'nurse[password_confirmation]', with: nurse.password
            select ward.ward_name, from: '病棟'
            click_button '新規登録'
            expect(page).to have_content 'はすでに存在します'
          end
        end
      end
    end


    describe 'ログイン後' do
      before  { nurse_login(other_nurse) }

      describe '看護師編集' do
        context '編集に成功する' do
          it 'フォームの入力値が正常' do
            visit mypage_path(other_nurse)
            fill_in 'nurse[name]', with: other_nurse.name
            select ward.ward_name, from: '病棟'
            click_button '編集内容を保存'
            expect(page).to have_content '編集に成功しました'
          end
        end
      end
    end



  end
end
