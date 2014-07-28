class User < ActiveRecord::Base
	self.table_name ='USER'
        self.primary_key=:USER_NO
end
