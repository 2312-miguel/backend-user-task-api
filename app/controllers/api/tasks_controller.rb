module Api
  class TasksController < BaseController
    before_action :set_task, only: [:show, :update, :destroy]

    def index
      tasks = Task.all
      render json: tasks
    end

    def show
      render json: @task
    end

    def create
      task = Task.new(task_params)
      if task.save
        render json: task, status: :created
      else
        render json: task.errors, status: :unprocessable_entity
      end
    end

    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @task.destroy
      head :no_content
    end

    private

    def set_task
      @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Tarea no encontrada' }, status: :not_found
    end

    def task_params
      params.require(:task).permit(:title, :description, :status, :due_date, :user_id)
    end
  end
end
