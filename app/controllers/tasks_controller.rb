class TasksController < ApplicationController
  def index
    @tasks = Task.all

    search_word = params[:word].presence
    @tasks = @tasks.where("name LIKE ?","%#{search_word}") if search_word
    if params[:status].present?
      @tasks = @tasks.where(status: params[:status])
    else
      @tasks = @tasks.all
    end

    case params[:order]
      when 'limit'
        @tasks = @tasks.order(limit: :desc)
      when 'created_at'
        @tasks = @tasks.order(create_at: :desc)
      when 'status'
        @tasks = @tasks.order(status: :desc)
      when 'priority'
        @tasks = @tasks.order(priority: :asc)
    end

    @tasks = @tasks.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url,notice: "タスク「#{task.name}」を削除しました。"
  end

  def search
    @tasks = Task.search(params[:q])
    render "index"
  end

  private

  def task_params
    params.require(:task).permit(:name,:description,:limit,:status,:priority)
  end

end
