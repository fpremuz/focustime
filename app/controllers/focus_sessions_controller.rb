class FocusSessionsController < ApplicationController
  def index
    task_id = params[:task_id]
    start_date  = params[:start_date].presence && Date.parse(params[:start_date])
    end_date    = params[:end_date].presence && Date.parse(params[:end_date])

    @focus_sessions = FocusSession.includes(:task)
    @focus_sessions = @focus_sessions.where(task_id: task_id) if task_id.present?
    @focus_sessions = @focus_sessions.where(start_time: start_date.beginning_of_day..) if start_date
    @focus_sessions = @focus_sessions.where(start_time: ..end_date.end_of_day) if end_date
    @focus_sessions = @focus_sessions.order(start_time: :desc)
    
    @grouped_sessions = @focus_sessions.group_by { |session| session.start_time.to_date }

    chart_scope = task_id.present? ? FocusSession.where(task_id: task_id) : FocusSession.all

    @task_durations = chart_scope.group(:task_id).sum(:duration).transform_keys { |id| Task.find_by(id: id)&.name || "Unknown Task" }

    pie_scope = FocusSession
    pie_scope = pie_scope.where(task_id: task_id) if task_id.present?
    pie_scope = pie_scope.where(start_time: start_date.beginning_of_day..) if start_date
    pie_scope = pie_scope.where(start_time: ..end_date.end_of_day) if end_date

    @task_pie_data = pie_scope
      .joins(:task)
      .group("tasks.name")
      .sum(:duration)

    @today_breakdown = FocusSession
      .includes(:task)
      .where(start_time: Time.zone.today.all_day)
      .group("tasks.name")
      .sum(:duration)
  end

  def create
    FocusSession.create!(
      task_id: params[:task_id],
      start_time: Time.zone.now,
      end_time: Time.zone.now,
      duration: params[:duration].to_i
    )
    head :ok
  end

  private

  def focus_session_params
    params.require(:focus_session).permit(:start_time, :end_time, :duration)
  end
end