class AddTitleToCatalogues < ActiveRecord::Migration[5.0]
  def change
    add_column :catalogues, :title, :string
  end
end
