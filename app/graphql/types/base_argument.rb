module Types
  class BaseArgument < GraphQL::Schema::Argument
    include GraphQL::Pro::PunditIntegration::ArgumentIntegration
  end
end
