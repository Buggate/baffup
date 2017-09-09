class AddOperatorRefToLaunches < ActiveRecord::Migration[5.0]
  def change
    add_reference :launches, :operator, foreign_key: true
  end
end
