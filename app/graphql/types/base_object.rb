module Types
  class BaseObject < GraphQL::Schema::Object
    include GraphQL::Pro::PunditIntegration::ObjectIntegration
    field_class Types::BaseField
  end
end
