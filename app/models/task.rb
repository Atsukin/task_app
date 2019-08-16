class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :user

  enum status: { notstart: 0, launch: 1, complete: 2 }
  enum priority: { high: 0, middle: 1, low: 2 }

    class << self
    def localed_priorities
      priorities.keys.map do |s|
        [ApplicationController.helpers.t("priority.task.#{s}"), s]
      end
    end
    def localed_statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("status.task.#{s}"), s]
      end
    end
  end
  # class << self
  #       def search(query)
  #           rel = Task.all
  #           if query.present?
  #               rel = rel.where("status LIKE ? ",
  #               "%#{query}%")
  #           else
  #             return Task.all
  #           end
  #           rel
  #       end
  #   end
end
