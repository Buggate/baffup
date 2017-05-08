class AddPartyRefToInvites < ActiveRecord::Migration[5.0]
  def change
    add_reference :invites, :party, foreign_key: true
  end
end
