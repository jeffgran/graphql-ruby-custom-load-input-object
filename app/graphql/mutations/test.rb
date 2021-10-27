module Mutations
  class Test < BaseMutation
    pundit_policy_class ApplicationPolicy
    pundit_role :allow

    argument :params,
      Types::ParamsType,
      "Some params",
      required: false

    argument :something_id, ID,
      loads: Something,
      required: false,
      pundit_policy_class: ApplicationPolicy,
      pundit_role: :allow

    field :success, Boolean, null: false

    def load_something(id)
      Something.new
    end

    def resolve(**args)
      { success: true }
    end
  end
end
