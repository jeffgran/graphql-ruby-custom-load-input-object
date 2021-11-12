module Mutations
  class Test < BaseMutation
    pundit_policy_class ApplicationPolicy
    pundit_role :allow

    argument :params,
      Types::ParamsType,
      "Some params",
      required: false

    argument :something_id, ID, required: false

    field :success, Boolean, null: false

    def resolve(something_id:, params:)
      system(something_id)
      { success: true }
    end
  end
end
