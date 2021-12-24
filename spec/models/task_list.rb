require 'rails_helper'

RSpec.describe TaskList, type: :model do
  describe 'モデルのテスト' do
    it "有効なtask_listの場合は保存されるか" do
      expect(build(:task_list)).to be_valid
    end
  end
end
