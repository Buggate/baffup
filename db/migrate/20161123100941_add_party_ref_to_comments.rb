class AddPartyRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :party, foreign_key: true
  end
end
