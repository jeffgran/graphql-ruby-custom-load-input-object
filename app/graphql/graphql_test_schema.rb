class GraphqlTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  def self.object_from_id(node_id, ctx)
    raise "this should not be called in this case as we are attempting to add a custom load method for the argument"
  end
end
