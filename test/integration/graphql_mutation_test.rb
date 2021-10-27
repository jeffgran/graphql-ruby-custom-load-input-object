require 'test_helper'

class GraphqlMutationTest < ActionDispatch::IntegrationTest
  test "top level" do
    query_string = <<-GRAPHQL
      mutation test($something_id: String!){
        mutation_result: test(input: {somethingId: $something_id}) {
          success
        }
      }
    GRAPHQL

    result = GraphqlTestSchema.execute(query_string, variables: { something_id: "some_id"})

    assert result.to_h["data"]["mutation_result"]["success"] == true
  end

  test "input object" do
    query_string = <<-GRAPHQL
      mutation test($params: Params!){
        mutation_result: test(input: {params: $params}) {
          success
        }
      }
    GRAPHQL

    result = GraphqlTestSchema.execute(query_string, variables: { params: {somethingId: "some_id"} })

    assert result.to_h["data"]["mutation_result"]["success"] == true
  end
end
