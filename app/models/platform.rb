class Platform < ActiveRecord::Base
	self.table_name ='PLATFORM'
	self.primary_key=:PLATFORM_NO
	has_one :aws_platform, foreign_key: 'PLATFORM_NO'
end
