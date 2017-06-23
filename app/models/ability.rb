##
# Esta classe é responsável por gerenciar as permissões
# dentro do sistema

class Ability
  include CanCan::Ability

  ##
  # Este método inicializa as permissões de um determinado usuário
  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :manage, Discipline
      can :read, User, id: user.id
    end
  end
end
