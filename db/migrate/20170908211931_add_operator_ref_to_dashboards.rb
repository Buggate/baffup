class AddOperatorRefToDashboards < ActiveRecord::Migration[5.0]
  def change
    add_reference :dashboards, :operator, foreign_key: true
  end
end
