class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can %i[read create], :all
    end
  end

  private

  def admin_abilities
    moderator_abilities
    can :manage, :all
  end

  def moderator_abilities
    registered_user_abilities
    can :manage, Product
    can :manage, Category
  end

  def registered_user_abilities
    visitor_abilities
    can :read, Cart
    can %i[create update delete], Comments
  end

  def visitor_abilities
    can :read, Product
    can :read, Category
    can %i[read update destroy], Cart
  end
end
