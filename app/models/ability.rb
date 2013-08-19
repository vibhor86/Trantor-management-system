class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.hr?
      can :manage, :all
    elsif user.individual?
      can :manage, User, :id => user.id
    elsif user.manager?
      can :manage, User, :id => user.id
    else
      can :manage, User, :id => user.id
    end
  end
end
