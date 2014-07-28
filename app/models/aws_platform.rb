class AwsPlatform < ActiveRecord::Base
	self.table_name='PLATFORM_AWS'
	self.primary_key=:PLATFORM_NO
	belongs_to :platform , foreign_key: 'PLATFORM_NO'
end
