class TodoController < ApplicationController
  # before_action :find_user

  def index

     @user = User.find
    @todos = Todo.all.order("created_at desc")
    @todo = Todo.new

    # @todos = Todo.all.order("created_at desc").limit(10).offset(@page * 10)
    # @todos = Todo.all.paginate :page => params[:page], :order => ("created_at desc")
    #@todos = Todo.paginate(:name).page params[:page]
    #Todo.paginate(page: params[:page], per_page: 10)
    @todos = @todos.paginate(:page => params[:page], :per_page => 10)
  end

  # def self.pagination_request(page)
  #   paginate :per_page => 10, :page => page
  # end

  def show
    @todo = Todo.find(params[:id])
  end

  # def new
  #   @todo = Todo.new
  # end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todo_index_path
    else
      render :new
    end
  end

  def edit
    # debugger
    @todo = Todo.find(params[:id])
    respond_to do |f|
       f.html { render update}
      f.js

    end
  end

  def update

    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todo_index_path
    else
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :completed_at, :note, :priorty)
    end
 # "#{ def set_page
 #    @page = params[:page] || 1
 #  end}"
end
