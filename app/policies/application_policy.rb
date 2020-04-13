class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user

    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  # quickly define the set of the actions for the users
  def self.permit_access(*actions)
    actions.each do |action|
      define_method("#{action}?") do
        true
      end
    end
  end

  def self.permit_conditional_access(actions, options)
    actions.each do |action|
      define_method("#{action}?") do
        public_send(options[:if])
      end
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
