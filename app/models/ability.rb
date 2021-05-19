class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.role.name}_permits", user)
  end

  def admin_permits(user)
    can :manage, :all
  end
  
  def client_permits(user)
    can :read, Post, :all
    can :manage, Post, { user_id: user.id}
    can [:read, :update], User, { id: user.id }
  end

  def visitor_permits(user)
    can :read, Post, :all
  end

  def list_of_permits
    rules.map do |rule|
      object = { action: rule.actions, over: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = true unless rule.base_behavior
      object
    end
  end
end