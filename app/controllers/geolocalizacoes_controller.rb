class GeolocalizacoesController < ApplicationController
    
	def index
		@locaisDaCapoeira = Local.all
	end

end
