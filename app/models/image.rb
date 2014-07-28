class Image < ActiveRecord::Base
	self.table_name = 'IMAGE'
	self.primary_key=:IMAGE_NO
	has_one :aws_image, foreign_key: 'IMAGE_NO'
end
