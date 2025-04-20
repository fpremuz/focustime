class FocusSession < ApplicationRecord
  belongs_to :task

  scope :today, -> { where("start_time >= ?", Time.zone.now.beginning_of_day) }

  def self.today_total_duration
    today.sum(:duration)
  end
end