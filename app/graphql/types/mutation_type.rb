module Types
  class MutationType < Types::BaseObject
    pundit_policy_class ApplicationPolicy
    pundit_role :allow

    field :test, mutation: Mutations::Test
  end
end
