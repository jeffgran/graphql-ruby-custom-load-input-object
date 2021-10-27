module Mutations
  class Test < BaseMutation

    argument :params,
      Types::ParamsType,
      "Some params",
      required: true

    field :success, Boolean, null: false

    def resolve(**args)
      { success: true }
    end
  end
end
