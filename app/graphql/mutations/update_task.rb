module Mutations
  class UpdateTask < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :status, String, required: false
    argument :due_date, GraphQL::Types::ISO8601Date, required: false

    type Types::TaskType

    def resolve(id:, **args)
      task = Task.find(id)
      task.update!(args)
      task
    rescue ActiveRecord::RecordNotFound
      GraphQL::ExecutionError.new("Tarea no encontrada")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Error actualizando: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
