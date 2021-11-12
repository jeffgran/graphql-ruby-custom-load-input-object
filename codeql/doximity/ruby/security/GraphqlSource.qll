private import codeql.ruby.AST
private import codeql.ruby.Concepts
private import codeql.ruby.controlflow.CfgNodes
private import codeql.ruby.DataFlow
private import codeql.ruby.dataflow.RemoteFlowSources
private import codeql.ruby.ast.internal.Module


private class GraphqlRelayClassicMutationAccess extends ConstantReadAccess {
  //GraphQL::Schema::RelayClassicMutation
  GraphqlRelayClassicMutationAccess() {
    this.getName() = "RelayClassicMutation" and
    this.getScopeExpr().(ConstantAccess).getName() = "Schema"
    this.getScopeExpr().(ConstantAccess).getScopeExpr().(ConstantAccess).getName() = "GraphQL"
  }
}

/**
 * A `ClassDeclaration` for a class that extends `ActionController::Base`.
 * For example,
 *
 * ```rb
 * class FooController < ActionController::Base
 *   def delete_handler
 *     uid = params[:id]
 *     User.delete_by("id = ?", uid)
 *   end
 * end
 * ```
 */
class GraphqlRelayClassicMutationClass extends ClassDeclaration {
  GraphqlRelayClassicMutationClass() {
    // class FooController < ActionController::Base
    this.getSuperclassExpr() instanceof GraphqlRelayClassicMutationAccess
    or
    // class BarController < FooController
    exists(GraphqlRelayClassicMutationAccess other |
      other.getModule() = resolveScopeExpr(this.getSuperclassExpr())
    )
  }

  /**
   *
   */
  GraphqlResolveMethod getResolve() { result = this.getAMethod("resolve") }
}


class GraphqlResolveMethod extends Method, HTTP::Server::RequestHandler::Range {
  private GraphqlRelayClassicMutationClass mutationClass;

  GraphqlResolveMethod() { this = mutationClass.getResolve() }

  override Parameter getARoutedParameter() { result = this.getAParameter() }

  override string getFramework() { result = "Graphql" }

  /** Gets the mutation class containing this method. */
  GraphqlRelayClassicMutationClass getMutationClass() { result = mutationClass }
}
