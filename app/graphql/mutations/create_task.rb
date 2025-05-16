module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :status, String, required: true
    argument :due_date, GraphQL::Types::ISO8601Date, required: true
    argument :user_id, ID, required: true

    type Types::TaskType

    def resolve(**args)
      Task.create!(args)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Error creando la tarea: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end