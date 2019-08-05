class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  enum status: { notstart: 0, launch: 1, complete: 2 }
    class << self
    def localed_statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("status.task.#{s}"), s]
      end
    end
  end
end
