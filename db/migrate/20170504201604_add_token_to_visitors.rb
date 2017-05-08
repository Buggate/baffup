class AddTokenToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :token, :string
  end
end
