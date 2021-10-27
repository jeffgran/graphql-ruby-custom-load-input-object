class Something; end

module Types
  class ParamsType < Types::BaseInputObject
    argument :something_id, ID,
      loads: Something,
      required: true,
      pundit_policy_class: ApplicationPolicy,
      pundit_role: :allow

    # why does this not get called?
    def load_something(id)
      return "something"
    end
  end
end

