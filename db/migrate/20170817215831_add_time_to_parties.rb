class AddTimeToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :time, :time
  end
end
