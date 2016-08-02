class ChangedEventTypeToString < ActiveRecord::Migration
  def change
    change_column :events, :event_type, :string
  end
end
