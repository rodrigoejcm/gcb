# == Schema Information
#
# Table name: usuarios
#
#  id                     :integer          not null, primary key
#  nome                   :string
#  sobrenome              :string
#  apelido                :string
#  sexo                   :string
#  graduacao              :string
#  nome_professor         :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#  approved               :boolean          default(FALSE)
#

class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :termo, acceptance: true

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
    if graduacaoGenero.nil?
      return self.graduacao << ' ' << self.apelido
    elsif admin? 
     return "Administrador"
    else  
      return graduacaoGenero << ' ' << self.apelido
    end
  end

  def telefoneDeContato
    if self.telefone.nil?
      return "Telefone não Cadastrado"
    else
      return self.telefone
    end
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
