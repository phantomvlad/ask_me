class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    @question = Question.new(question_params)
    @questions = Question.all
    @question.author = current_user

    if @question.save
      Hashtag.create_hashtag(@question)
      redirect_to user_path(@question.user.nickname), notice: "Вопрос успешно создан!"
    else
      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    @question.update(question_params)
    Hashtag.create_hashtag(@question)

    redirect_to user_path(@question.user.nickname), notice: "Вопрос изменен"
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @hashtags = Hashtag.all
    @questions = Question.order(created_at: :desc).first(10)
    @question = Question.new
    @users = User.last(10)
  end

  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user.nickname), notice: "Ваш вопрос удален"
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path, notice: "Вопрос скрыт"
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
