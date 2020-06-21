class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params_user_info)
    if @user.save
      session[:user_id]= @user.id
      flash[:notice] = "登録完了です"
      redirect_to new_chart_path
    else
      flash[:notice] ="登録できません"
      render new_user_path
    end
  end


  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to new_chart_path
    else
      flash[:notice]="入力情報が間違っています"
      render "users/login_form"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_users_path
  end

  private
  def params_user_info
    params.require(:user).permit(:name, :password, :height)
  end

end
