class AddAttachmentPictureToParties < ActiveRecord::Migration
  def self.up
    change_table :parties do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :parties, :picture
  end
end
