class CreateLaunches < ActiveRecord::Migration[5.0]
  def change
    create_table :launches do |t|

    	t.string :email 

      t.timestamps
    end
  end
end

