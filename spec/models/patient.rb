require 'rails_helper'
RSpec.describe Patient, type: :model do
  describe 'モデルのテスト' do
    it "有効なpatientの場合は保存されるか" do
      expect(build(:patient)).to be_valid
    end
  end
end