class AddColumnCategoryToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :category, :string
  end
end
