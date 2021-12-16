class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new
    # if user.admin?
    #   can :manage, :all
    # else
    #   moderator_abilities if user.moderator?
    #   visitor_abilities if user.visitor?
    #
    #   can %i[read create update delete destroy], :all
    # return unless
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

  def visitor_abilities
    can :read, Cart
    can %i[create update delete], Comments, user: user
  end

  def guest_abilities
    can :read, Product
    can :read, Category
    cannot %i[read update destroy], Cart
  end
end
