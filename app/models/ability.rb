class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      # Game permissions
      can :read, Game do
        !user.id.blank?
      end

      can [:update, :destroy], Game do |game|
        game.holder_id == user.id
      end

      can :desire, Game do |game|
        game.owner_id != user.id && game.holder_id != user.id
      end

      can :accept_request, Game do |game|
        game.owner_id == user.id && game.state != 4
      end

      can :rent_back, Game do |game|
        game.holder_id == user.id && game.state == 4
      end

      can :update, Desire do |desire|
        desire.user == user
      end

      can :destroy, Desire do |desire|
        desire.user_id == user.id || desire.game.owner_id == user.id
      end

      can :read, User do
        !user.id.blank?
      end

      can :promote, User do
        user.admin?
      end
    end
  end
end
