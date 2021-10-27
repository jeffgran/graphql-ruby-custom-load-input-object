module Types
  class BaseObject < GraphQL::Schema::Object
    include GraphQL::Pro::PunditIntegration::ObjectIntegration
    field_class Types::BaseField
    pundit_policy_class ApplicationPolicy
    pundit_role :allow
  end
end
