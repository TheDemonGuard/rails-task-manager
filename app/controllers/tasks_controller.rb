class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # @count = Task.count
    # p @count

    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def show
    # @task = Task.find(params[:id])
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/update.html.erb
    redirect_to tasks_path
  end
end

private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :details, :completed)
end
