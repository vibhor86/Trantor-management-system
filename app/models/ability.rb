class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.hr?
      can :manage, :all
    elsif user.employee?
      can :update, :user, [:name]
    end
  end
end
