class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_create :set_default_role
  
  has_many :eventos
  has_many :publicacoes
  has_one :perfil

  def role?(r)
		role.include? r.to_s
	end

	def admin?
  		self.role == "admin"
	end
	
	def professor?
  		self.role == "professor"
	end

	def professor_premium?
  		self.role == "professor_premium"
	end

	def mestre?
  		self.role == "mestre"
	end

	def usuarioLimitado?
		!self.admin? && !self.mestre? && !self.professor_premium?
	end

  def possuiPerfil?
    !self.perfil.nil?
  end

  def graduacaoGenero

    if self.sexo == 'M'
      
      if self.graduacao == 'Instrutor(a)'
        return 'Instrutor'
      elsif self.graduacao == 'Professor(a)'
        return 'Professor'
      elsif self.graduacao == 'Formando(a)'
        return 'Formando'
      elsif self.graduacao == 'Formado(a)'
        return 'Formado'
      elsif self.graduacao == 'Mestre(a)'
        return 'Mestre'
      end

    elsif self.sexo == 'F'
      if self.graduacao == 'Instrutor(a)'
        return 'Instrutora'
      elsif self.graduacao == 'Professor(a)'
        return 'Professora'
      elsif self.graduacao == 'Formando(a)'
        return 'Formanda'
      elsif self.graduacao == 'Formado(a)'
        return 'Formada'
      elsif self.graduacao == 'Mestre(a)'
        return 'Mestre'
      end
    else
      return self.graduacao
    end 
 
  end

  def apelidoCompleto
    return graduacaoGenero << ' ' << self.apelido 
  end

	def active_for_authentication? 
    	super && approved? 
  	end 

  	def inactive_message 
    	if !approved? 
      		:not_approved 
    	else 
      		super # Use whatever other message 
    	end 
  	end
      
	private
  		def set_default_role
    		self.role ||= 'professor'
  		end


end
