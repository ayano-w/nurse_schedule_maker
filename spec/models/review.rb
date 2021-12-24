require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'モデルのテスト' do
    it "有効なreviewの場合は保存されるか" do
      expect(build(:review)).to be_valid
    end
  end
end
