module Types
  class BaseField < GraphQL::Schema::Field
    include GraphQL::Pro::PunditIntegration::FieldIntegration
    argument_class Types::BaseArgument
  end
end
