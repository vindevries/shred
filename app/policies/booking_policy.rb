class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
   true
  end

  def create?
   user && !user.instructor
  end

  def create?
    user && !user.instructor
  end

  def update?
    user && record.user
  end

  def accept?
    user && record.instructor
  end

  def reject?
    user && record.instructor
  end
end
