require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'モデルのテスト' do
    it "有効なtaskの場合は保存されるか" do
      expect(build(:task)).to be_valid
    end

    it "taskが空白の場合にエラーメッセージが返ってくるか" do
      task = build(:task, task: nil)
      task.valid?
      expect(task.errors[:task]).to include("を入力してください")
    end

    it "10文字以上の場合エラーになるか" do
      task = build(:task, task: "abcdefghijk")
      task.valid?
      expect(task.errors[:task]).to include("は10文字以内で入力してください")
    end
  end
end
