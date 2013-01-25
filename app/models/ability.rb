class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.hr?
      can :manage, :all
    elsif user.employee?

    elsif user.manager?

    end
  end
end
