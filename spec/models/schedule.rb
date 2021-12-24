require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'モデルのテスト' do
    it "有効なscheduleの場合は保存されるか" do
      expect(build(:schedule)).to be_valid
    end
  end
end
