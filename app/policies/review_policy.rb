class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
   true
    # user && record.booking.user && !record.booking.review
  end
end
