class InstructorPackagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.instructor
  end

  def destroy?
    user == record.instructor.user
  end
end
