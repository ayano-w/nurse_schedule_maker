require 'rails_helper'

RSpec.describe Admin, type:model do
  describe 'モデルのテスト' do
    it "有効なadminの場合は保存されるか" do
      expect(build(:amin)).to be_valid
    end 
    
    context "空白のバリデーションチェック" do
      it "nameが空白の場合にエラーメッセージが返ってくるか" do
      admin = build(:admin, name: nil)
      admin.valid?
  end
end
