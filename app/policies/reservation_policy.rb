class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.hobbit
        scope.joins("JOIN offers ON offers.id = reservations.offer_id WHERE offers.user_id = #{user.id}")
      else
        scope.where(user: user)
      end
    end
  end

  def new?
    create?
  end

  def create?
    !user.hobbit
  end

  def show?
    record.user == user or record.offer.user == user
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def accept?
    user.hobbit and record.offer.user == user
  end

  def decline?
    user.hobbit and record.offer.user == user
  end
end
