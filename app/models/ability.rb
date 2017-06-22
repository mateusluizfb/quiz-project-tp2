class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :manage, Discipline
      can :read, User, id: user.id
    end
  end
end
