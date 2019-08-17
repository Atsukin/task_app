class User < ApplicationRecord
  before_destroy :confirm_none_admin_user
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks

  private
  def confirm_none_admin_user
    if User.where(admin: true).count == 1
      errors.add(:admin, 'は０にすることはできません。')
      return false
    else
      return true
    end
  end
end
