module Types
  class QueryType < Types::BaseObject
    # Lista todos los usuarios
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    # Lista todas las tareas
    field :tasks, [Types::TaskType], null: false

    def tasks
      Task.all
    end
  end
end
