class AddBookingId < ActiveRecord::Migration
  def change
    add_column :cities, :booking_id, :integer
  end
end
