class Ability
  # Add in CanCan's ability definition DSL
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :delete, Property, user: user
    can :update, Property, user: user
    can :create, Property, user: user

    can :create, Booking, user: user
    can :delete, Booking, user: user

    return unless user.admin? # additional permissions for administrators

    can :delete, Property
    can :update, Property
    can :create, Property
  end
end