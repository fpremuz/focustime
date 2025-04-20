class AddTaskIdToFocusSessions < ActiveRecord::Migration[8.0]
  def change
    add_reference :focus_sessions, :task, foreign_key: true
  end
end
