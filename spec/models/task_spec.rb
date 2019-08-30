require 'rails_helper'

RSpec.describe Task, type: :model do
  # タスク名があれば有効な状態であること
  it "is valid with a name, description" do
    task = Task.new(
      name: 'タスク名',
      description: 'タスクの詳細',
    )
    expect(task).to be_valid
  end

  # タスク名がなければ無効な状態であること
  it "is invalid without a name" do
    task = Task.new(name: nil)
    task.valid?
    expect(task.errors[:name]).to_not include("can't be blank")
  end

  #タスクの詳細がなくても有効な状態であること
  it "is valid without a description" do
    task = Task.new(
      name: 'タスク名',
      description: nil,
    )
    expect(task).to be_valid
  end
end
