class TasksController < ApplicationController
    skip_before_action :authenticate_user, only: [:index, :create, :update, :delete, :show]
    def index
      @tasks = Task.all 
      render json: @tasks
    end
  
    def create
      @task = Task.create(task_params)
      if @task.save
        render json: {title: @task.title, details: @task.details, status: @task.status}, status: :created
      else 
        render json: @task.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params) 
        render json: {title: @task.title, details: @task.details, status: @task.status}, status: :ok
      else 
        render json: @task.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def delete
      @task = Task.find(params[:id])
      if @task.destroy
        render json: "Deleted successfully", status: :ok 
      end
    end
  
    def show
      @task = Task.find(params[:id])
      render json: {title: @task.title, details: @task.details, status: @task.status}
    end
  
  def task_params 
    params.require(:task).permit(:title, :details, :status)
  end
  end
  