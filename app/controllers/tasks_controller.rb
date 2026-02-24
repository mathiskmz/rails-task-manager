class TasksController < ApplicationController

  before_action :all_tasks, only: [:index, :show]
  before_action :find_task, only: [:edit, :update, :destroy]
  def index
    # @tasks = Task.all
  end

  def show
    # @tasks = Task.all
    @task = @tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update 
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end


  private

  def find_task
    @task = Task.find(params[:id])
  end

  def all_tasks
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
