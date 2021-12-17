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

    visitor_abilities(user.id)
    return unless user.moderator?

    moderator_abilities(user.id)
    return unless user.admin?

    admin_abilities
  end

  private

  def guest_abilities
    can :read, [Category, Product, Comment]
  end

  def visitor_abilities(user_id)
    can %i[read create update destroy], Cart
    can :read, [Category, Product, Comment]
    can %i[read create update destroy], Comment, user_id: user_id
  end

  def moderator_abilities(user_id)
    visitor_abilities(user_id)
    can :manage, Category
    can :manage, Product
    can :manage, Comment
  end

  def admin_abilities
    can :manage, :all
  end
end
