class Something; end

module Types
  class ParamsType < Types::BaseInputObject
    argument :something_id, String,
      loads: ::Something,
      required: true

    # why does this not get called?
    def load_something(id)
      return "something"
    end
  end
end

