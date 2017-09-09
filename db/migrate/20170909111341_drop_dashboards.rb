class DropDashboards < ActiveRecord::Migration[5.0]
  def change

  	drop_table :dashboards
  	
  end
end
