class Hashtag < ApplicationRecord
  has_many :question_hashtags
  has_many :questions, through: :question_hashtags, source: :question

  validates :body,
            presence: true,
            uniqueness: true

  private

  REGEX_HASHTAG = /#[[:word:]-]+/

  def self.create_hashtag(question)
    question.body.scan(REGEX_HASHTAG).each do |word|
      hashtag = Hashtag.new(body: word.downcase)
      if hashtag.save
        QuestionHashtag.new(question: question, hashtag: hashtag).save
      else
        QuestionHashtag.new(question: question, hashtag: Hashtag.find_by(body: word.downcase)).save
      end
    end
  end
end
