class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|

        t.string   :title
         t.string   :venue
         t.date     :date
         t.references :user

        
      t.timestamps

    end

    

  end
end
