class AddHeaderPhotoToProfiles < ActiveRecord::Migration[5.0]
  def change

    add_attachment :profiles, :header_photo


  end
end


