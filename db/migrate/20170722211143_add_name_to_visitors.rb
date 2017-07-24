class AddNameToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :name, :string
  end
end
