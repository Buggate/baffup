class AddRequestRefToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_reference :visitors, :request, foreign_key: true
  end
end
