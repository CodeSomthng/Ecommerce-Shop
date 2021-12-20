class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # Guest user
    # if user.admin?
    #   can :manage, :all
    # else
    #   moderator_abilities if user.moderator?
    #   visitor_abilities if user.visitor?
    #
    #   can %i[read create update delete destroy], :all

    guest_abilities
    return if user.blank?

    banned_abilities(user.id)
    return if user.banned_users?

    visitor_abilities(user.id)
    return if user.visitor?

    moderator_abilities(user.id)
    return unless user.moderator?

    admin_abilities
    return unless user.admin?
  end

  private

  def guest_abilities
    can :read, [Category, Product, Comment]
  end

  def visitor_abilities(user_id)
    can %i[read create update destroy], Cart
    can :read, [Category, Product, Comment]
    can :search, Product
    can %i[read create update destroy], Comment, user_id: user_id
  end

  def moderator_abilities(user_id)
    visitor_abilities(user_id)
    can :manage, Category
    can :manage, Product
    can :manage, Comment
  end

  def banned_abilities(_user_id)
    guest_abilities
  end

  def admin_abilities
    can :manage, :all
  end
end
