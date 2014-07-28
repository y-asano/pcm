class AwsImage < ActiveRecord::Base
	self.table_name = 'IMAGE_AWS'
	self.primary_key=:IMAGE_NO
	belongs_to :image , foreign_key: 'IMAGE_NO'
end
