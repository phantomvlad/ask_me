class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by!(body: params[:body])
    @questions = @hashtag.questions
  end
end
