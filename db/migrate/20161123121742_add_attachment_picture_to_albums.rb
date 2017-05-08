class AddAttachmentPictureToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :albums, :picture
  end
end
