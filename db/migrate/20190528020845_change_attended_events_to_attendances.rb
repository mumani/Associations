class ChangeAttendedEventsToAttendances < ActiveRecord::Migration[5.2]
  def change
    rename_table :attended_events, :attendances
  end
end
