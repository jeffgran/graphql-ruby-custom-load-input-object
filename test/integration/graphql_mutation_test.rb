require 'test_helper'

class GraphqlMutationTest < ActionDispatch::IntegrationTest
  test "the truth" do
    #assert true

    query_string = <<-GRAPHQL
      mutation test($params: Params!){
        mutation_result: test(input: {params: $params}) {
          success
        }
      }
    GRAPHQL


    #post = create(:post_with_comments, title: "My Cool Thoughts")
    #post_id = MySchema.id_from_object(post, Types::Post, {})
    result = GraphqlTestSchema.execute(query_string, variables: { params: {somethingId: "some_id"} })

    pp result
  end
end
