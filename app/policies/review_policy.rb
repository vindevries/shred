class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user && record.booking.user == user && !record.booking.review&.persisted?
  end
end
