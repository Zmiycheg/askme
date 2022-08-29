module QuestionsHelper
  def question_author(question)
    if question.author
      link_to "@#{question.author.nickname}", question.author
    else
      content_tag :i, 'кто-то неизвестный'
    end
  end
end
