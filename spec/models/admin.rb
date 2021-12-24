require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'モデルのテスト' do
    it "有効なadminの場合は保存されるか" do
      expect(build(:admin)).to be_valid
    end

    context "空白のバリデーションチェック" do
      it "nameが空白の場合にエラーメッセージが返ってくるか" do
        admin = build(:admin, name: nil)
        admin.valid?
        expect(admin.errors[:name]).to include("を入力してください")
      end
      it "wardが空白の場合にエラーメッセージが返ってくるか" do
        admin = build(:admin, ward: nil)
        admin.valid?
        expect(admin.errors[:ward]).to include("を入力してください")
      end
      it "passwardが空白の場合にエラーメッセージが返ってくるか" do
        admin = build(:admin, password: nil)
        admin.valid?
        expect(admin.errors[:password]).to include("を入力してください")
      end
    end
    
    context "一意性の確認" do
      before do 
        @admin = build(:admin)
      end
      
      it "同じ名前の場合エラーになるか" do
        @admin.save
        another_admin = build(:admin)
        another_admin.name = @admin.name
        another_admin.valid?
        expect(another_admin.errors[:name]).to include("はすでに存在します")
      end  
    end  
  end
end
