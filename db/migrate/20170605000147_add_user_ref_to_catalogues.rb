class AddUserRefToCatalogues < ActiveRecord::Migration[5.0]
  def change
    add_reference :catalogues, :user, foreign_key: true
  end
end
