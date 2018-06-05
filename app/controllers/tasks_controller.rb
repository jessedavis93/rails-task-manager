class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelist_params)
    @task.save
    redirect_to tasks_path()
  end

  def edit
  end

  def update
    @task.update(whitelist_params)

    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end


  private


  def whitelist_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
