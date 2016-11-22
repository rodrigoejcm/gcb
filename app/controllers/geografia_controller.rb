class GeografiaController < ApplicationController
  
  def estadosprovincias
    
    @estados=CS.states(geografia_params[:pais])

    respond_to do |format|
      format.js

    end

  end

  def cidades
    
    @cidades=CS.cities(geografia_params[:estado], geografia_params[:pais])

    respond_to do |format|
      format.js

    end
      
  end

  private
    def geografia_params
      params.permit( :pais, :estado, :id, :_) # List here whitelisted params

    end
end