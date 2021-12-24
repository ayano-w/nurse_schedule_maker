require 'rails_helper'

RSpec.describe Nurse, type: :model do
  describe 'モデルのテスト' do
    it "有効なnurseの場合は保存されるか" do
      expect(build(:nurse)).to be_valid
    end

    context "空白のバリデーションチェック" do
      it "nameが空白の場合にエラーメッセージが返ってくるか" do
        nurse = build(:nurse, name: nil)
        nurse.valid?
        expect(nurse.errors[:name]).to include("を入力してください")
      end
      it "wardが空白の場合にエラーメッセージが返ってくるか" do
        nurse = build(:nurse, ward: nil)
        nurse.valid?
        expect(nurse.errors[:ward]).to include("を入力してください")
      end
      it "passwardが空白の場合にエラーメッセージが返ってくるか" do
        nurse = build(:nurse, password: nil)
        nurse.valid?
        expect(nurse.errors[:password]).to include("を入力してください")
      end
    end

    context "一意性の確認" do
      before do
        @nurse = build(:nurse)
      end

      it "同じ名前の場合エラーになるか" do
        @nurse.save
        another_nurse = build(:nurse)
        another_nurse.name = @nurse.name
        another_nurse.valid?
        expect(another_nurse.errors[:name]).to include("はすでに存在します")
      end
    end
  end
end
