require 'rails_helper'

RSpec.describe User, type: :model do
  # 名、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    user = User.new(
      name: 'sample',
      email: 'sample@sample.com',
      password: 'password',
    )
    expect(user).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to_not include("can't be blank")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to_not include("can't be blank")
  end
  # メールアドレスが重複しないこと
  it "is invalid with a duplicate email address" do
    User.create(
      name: 'name',
      email: 'test@example.com',
      password: 'password'
    )
    user = User.new(
      name: 'second',
      email: 'test@example.com',
      password: 'pass'
    )
    user.valid?
    expect(user.errors[:email]).to_not include('has already been taken')
  end
end
