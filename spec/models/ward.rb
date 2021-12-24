require 'rails_helper'

RSpec.describe Ward, type: :model do
  describe 'モデルのテスト' do
    it "有効なwardの場合は保存されるか" do
      expect(build(:ward)).to be_valid
    end

    context "一意性の確認" do
      before do
        @ward = build(:ward)
      end
      it "同じ名前の場合エラーになるか" do
        @ward.save
        another_ward = build(:ward)
        another_ward.ward_name = @ward.ward_name
        another_ward.valid?
        expect(another_ward.errors[:ward_name]).to include("はすでに存在します")
      end
    end
  end
end
