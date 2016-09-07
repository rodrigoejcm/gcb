class AprovacoesController < ApplicationController

 

	def aprovacoes
      @publicacoes_aprovados = Publicacao.where(aprovado: "APROVADO")
      @publicacoes_reprovados = Publicacao.where(aprovado: "REPROVADO")
      @publicacoes_indefinidos = Publicacao.where(aprovado: "INDEFINIDO")
      @publicacoes = Publicacao.all

      @eventos_aprovados = Evento.where(aprovado: "APROVADO")
      @eventos_reprovados = Evento.where(aprovado: "REPROVADO")
      @eventos_indefinidos = Evento.where(aprovado: "INDEFINIDO")
      @eventos = Evento.all


	end


end
