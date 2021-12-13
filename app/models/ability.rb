# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :update, Category, Product, user: moderator
    # visitor_abilities
    # return unless user.present?
    #
    # admin_abilities if user.admin?
    # moderator_abilities if user.moderator?
    # visitor_abilities if user.visitor?

    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
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
    # can :read, Comments
    can %i[read update destroy], Cart
  end

  # read: [:index, :show]
  # create: [:new, :create]
  # update: [:edit, :update]
  # destroy: [:destroy]
end
