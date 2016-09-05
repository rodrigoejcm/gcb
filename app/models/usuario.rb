class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :eventos

  	def role?(r)
		role.include? r.to_s
	end

	def admin?
  		self.role == "admin"
	end
	
	def professor?
  		self.role == "professor"
	end

	def professor_premiun?
  		self.role == "professor"
	end

	def mestre?
  		self.role == "mestre"
	end
      



end
