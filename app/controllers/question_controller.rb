# coding: utf-8

class QuestionController < ApplicationController
  @@dougi_num = 320
  @@taigi_num = 312

  def dougi
    @num = params[:num].to_i
    if @num == 1
      arr = get_question("dougi")
      session[:questions] = arr
    elsif (2..10).include?(@num)
      arr = session[:questions]
    elsif @num == 11
      redirect_to :controller => 'question', :action => 'score'
      return
    end
    q = arr[@num - 1]
    @question = q[0].question + "の同義語は?"
    @select = [q[0].answer, q[1].question, q[1].answer, q[2].question, q[2].answer]
  end

  def taigi
    @num = params[:num].to_i
    if @num == 1
      arr = get_question("taigi")
      session[:questions] = arr
    elsif (2..10).include?(@num)
      arr = session[:questions]
    elsif @num == 11
      redirect_to :controller => 'question', :action => 'score'
      return
    end
    q = arr[@num - 1]
    @question = q[0].question + "の対義語は?"
    @select = [q[0].answer, q[1].question, q[1].answer, q[2].question, q[2].answer]
  end

  def explain
    @selected = params[:a]
    num = params[:num]
    questions = session[:questions]
    puts questions
    question = questions[num.to_i - 1]
    @answer = question[0].answer
    if @selected == @answer
      @message = "正解"
    else
      @message = "不正解"
    end
    @num = num.to_i + 1
  end

  def score
    render text: "score"
  end

  private
  def get_question(type)
    if type == "dougi"
      t = Dougi
      num = @@dougi_num
    elsif type == "taigi"
      t = Taigi
      num = @@taigi_num
    end

    questions = []
    10.times do |i|
      questions << t.find(get_random(num))
    end
    questions
  end

  def get_random(num)
    arr = []
    pre_num = 0
    loop do
      num = Random.rand(num) + 1
      arr << num unless pre_num == num
      if arr.length == 3
        break
      end
      pre_num = num
    end
    arr
  end
end
