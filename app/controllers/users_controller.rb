class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Вы успешно зарегистрировались!"
    else
      flash.now[:alert] = "Неверно заполнены поля"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "Вы успешно обновили аккаунт!"
    else
      flash.now[:alert] = "При попытке сохранить пользователя возникли ошибки"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)
    redirect_to root_path, notice: "Пользователь удален"
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :phone, :password, :password_confirmation, :navbar_color)
  end
end
