class AddAttendPartyToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :attend_party, :date
  end
end
