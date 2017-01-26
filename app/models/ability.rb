class Ability
  include CanCan::Ability

  def initialize(usuario)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    usuario ||= Usuario.new # guest user

   
    
    
    if !usuario.role
        can :show, Evento, aprovado: "APROVADO"
        can :public_evento, Evento
        can :show, Publicacao, aprovado: "APROVADO"
        can :public_publicacao, Publicacao
        can :public_publicacoes, Publicacao

    elsif usuario.admin?
        can :manage, :all
    elsif usuario.mestre?
        can :manage, :all
        
        
    elsif usuario.professor? 
        #Evento
        can :read, Evento
        can :create, Evento
        can [:update, :destroy], Evento, :usuario => usuario
        can :public_evento, Evento
        can :public_eventos, Evento

        #Publicação
        can :read, Publicacao
        can :create, Publicacao
        can [:update, :destroy], Publicacao, :usuario => usuario
        can :public_publicacao, Publicacao
        can :public_publicacoes, Publicacao
        
        #Local
        can :read, Local
        can :create, Local
        can [:update, :destroy], Local, :usuario => usuario

        #Turma
        can :read, Turma
        can :create, Turma
        can [:update, :destroy], Turma, :usuario => usuario

        #Localizacao


    elsif usuario.professor_premium? 
        #Evento
        can :read, Evento
        can :create, Evento
        can [:update, :destroy], Evento, :usuario => usuario
        #Publicação
        can :read, Publicacao
        can :create, Publicacao
        can [:update, :destroy], Publicacao, :usuario => usuario
        can :public_publicacao, Publicacao
        can :public_publicacoes, Publicacao
        can :public_evento, Evento
        can :public_eventos, Evento

    elsif usuario.colaborador_teste?

        #Evento
        can :read, Evento
        can :create, Evento
        can [:update, :destroy], Evento, :usuario => usuario
        can :public_evento, Evento
        can :public_eventos, Evento

        #Publicação
        can :read, Publicacao
        can :create, Publicacao
        can [:update, :destroy], Publicacao, :usuario => usuario
        can :public_publicacao, Publicacao
        can :public_publicacoes, Publicacao
        
        #Local
        can :read, Local
        can :create, Local
        can [:update, :destroy], Local, :usuario => usuario

        #Turma
        can :read, Turma
        can :create, Turma
        can [:update, :destroy], Turma, :usuario => usuario

     end 
  
  end
end
