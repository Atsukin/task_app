class TasksController < ApplicationController
  def index
    @tasks = params[:order].present? ? current_user.tasks.order("#{params[:order].to_sym} DESC") : current_user.tasks
    @tasks = @tasks.where('name LIKE ?', "%#{params[:word]}") if params[:word].presence
    @tasks = @tasks.where(status: params[:status]) if params[:status].present?
    @tasks = @tasks.page(params[:page])
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
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
    params.require(:task).permit(:name,:description,:expiration,:status,:priority, { label_ids: [] })
  end

end
