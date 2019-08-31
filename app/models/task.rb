class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  enum status: { notstart: 0, launch: 1, complete: 2 }
  enum priority: { high: 0, middle: 1, low: 2 }
end
