class AnalyticsController < ApplicationController
  def index
    @today = FocusSession.where(start_time: Time.zone.today.all_day).sum(:duration)
    @this_week = FocusSession.where(start_time: Time.zone.now.beginning_of_week..Time.zone.now).sum(:duration)
    @this_month = FocusSession.where(start_time: Time.zone.now.beginning_of_month..Time.zone.now).sum(:duration)

    @daily_totals = FocusSession
      .where(start_time: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day)
      .group("DATE(start_time)")
      .sum(:duration)
  end
end