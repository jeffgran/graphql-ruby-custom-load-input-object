module Types
  class BaseField < GraphQL::Schema::Field
    include GraphQL::Pro::PunditIntegration::FieldIntegration
    argument_class Types::BaseArgument
    pundit_policy_class ApplicationPolicy
    pundit_role :allow
  end
end
