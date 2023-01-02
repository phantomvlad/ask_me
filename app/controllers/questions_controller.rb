class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @questions = Question.all

    if @question.save
      redirect_to root_path, notice: "Вопрос успешно создан!"
    else
      render :index
    end
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: "Вопрос изменен"
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Ваш вопрос удален"
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path, notice: "Вопрос скрыт"
  end

  private

  def question_params
    params.require(:question).permit(:body, :id_user)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
