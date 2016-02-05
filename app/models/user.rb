class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         has_many :recipes


    User_types = ["user", "super_user", "admin", "super-admin"]




    def is_admin?
    	 self.user_type == 3
    end

    def is_manager?
    	self.user_type == 2
    end

    def is_publisher?
    	self.user_type == 1
    end
end
