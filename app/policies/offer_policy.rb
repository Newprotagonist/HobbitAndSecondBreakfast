class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def show
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    current_user == user
  end

  def edit?
    update?
  end

  def destroy?
    current_user == user
  end
end
