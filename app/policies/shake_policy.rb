class ShakePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    # how can i check if the user is the owner?
    # restaurant.user == current_user
    # record correspond to the object that authorize is called on.
    # user corrosponds to current_user
    owner_or_admin
  end

  def update?
    owner_or_admin
  end

  def destroy?
    owner_or_admin
  end

  def owner_or_admin
    record.user == user || user.admin
  end
end
