class UsuariosController < ApplicationController
	def role?(r)
		role.include? r.to_s
	end
end