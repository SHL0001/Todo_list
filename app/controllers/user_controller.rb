class UserController < ApplicationController
  def index
    @users =User.all
    @user = User.new
  end
  def new
    @user = User.new
  end
  def show
    @user =User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_index_path, :notice => 'Thanks for signing up'
    else
      # render(
      #   html: "<script>alert('No users!')</script>".html_safe
      # )
      # render :'/user/_alert.js'
      #  alert='invalid email'
      end
  end
  def confirm
    #@user = User.new(user_params)
    if @user = User.exist?(params[:email])
    redirect_to  user_todo_index_path
    else
      flash.now[:error]='invalid email'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
