class SessionsController < ApplicationController
  before_action :set_task

  def create
    @session = @task.focus_sessions.create(start_time: Time.current)
    redirect_to @task, notice: "Focus session started!"
  end

  def destroy
    @session = @task.focus_sessions.where(end_time: nil).last
    if @session
      @session.update(end_time: Time.current)
      redirect_to @task, notice: "Focus session ended!"
    else
      redirect_to @task, alert: "No active session to stop."
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
