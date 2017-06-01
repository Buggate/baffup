class Catalogue < ApplicationRecord


	belongs_to :party, optional: true

	mount_uploader :file_name, CatalogueUploader

  
	 




end
