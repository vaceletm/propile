class ChangeSomeColumnsOfSessionToText < ActiveRecord::Migration
  def change
    change_column :sessions, :session_goal, :text
    change_column :sessions, :outline_or_timetable, :text
  end
end