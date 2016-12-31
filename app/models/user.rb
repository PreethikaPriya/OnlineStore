class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  #belongs_to :role 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def is_admin?
  	return true if self.role == "admin"
  	#binding.pry
end

end
