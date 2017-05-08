class AddDetailsToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :message, :text
    add_column :parties, :rsvp_by, :date
  end
end
