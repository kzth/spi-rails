# coding: utf-8

class QuestionController < ApplicationController
  # データベース内の問題数
  @@dougi_num = 320
  @@taigi_num = 312

  def dougi
    # 問題番号の取得
    @num = params[:num].to_i

    if @num == 1
      # 1問目
      # sessionに問題データを格納
      arr = get_question("dougi")
      session[:type] = "dougi"
      session[:questions] = arr
      session[:answers] = []
    elsif (2..10).include?(@num)
      # 2～10問目
      # sessionから問題データを取得する
      arr = session[:questions]
    elsif @num == 11
      # 採点画面へのリダイレクト
      redirect_to :controller => 'question', :action => 'score'
      return
    end

    q = arr[@num - 1]
    # 問題
    @question = q[0].question + "の同義語は?"
    # 選択肢
    @select = [q[0].answer, q[1].question, q[1].answer, q[2].question, q[2].answer]
  end

  def taigi
    # 問題番号の取得
    @num = params[:num].to_i

    if @num == 1
      # 1問目
      # sessionに問題データを格納
      arr = get_question("taigi")
      session[:type] = "taigi"
      session[:questions] = arr
      session[:answers] = []
    elsif (2..10).include?(@num)
      # 2～10問目
      # sessionから問題データを取得する
      arr = session[:questions]
    elsif @num == 11
      # 採点画面へのリダイレクト
      redirect_to :controller => 'question', :action => 'score'
      return
    end

    q = arr[@num - 1]
    # 問題
    @question = q[0].question + "の対義語は?"
    # 選択肢
    @select = [q[0].answer, q[1].question, q[1].answer, q[2].question, q[2].answer]
  end

  def explain
    # ユーザが選択した解答
    @selected = params[:a]
    # 問題番号の格納
    num = params[:num]
    # sessionから問題を取得
    questions = session[:questions]
    question = questions[num.to_i - 1]
    @answer = question[0].answer

    # 正誤判定
    count = 0
    if @selected == @answer
      @message = "正解"
      count = 1
    else
      @message = "不正解"
    end

    session[:answers].push count

    # 次の問題番号
    @num = num.to_i + 1

    # 問題の種類を指定
    @type = session[:type]
  end

  def score
    # 正解数の合計
    @correct_num = session[:answers].sum

    # 問題を格納していたsessionの初期化
    session[:questions] = []
    @user = session[:user_id]

    # 正解数×10ポイント加算する
    @add_point = @correct_num * 10
    @point = add_point(@user, @add_point)
  end

  private
  # 問題をランダムに10問取ってくる関数
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

  # 問題取得のためのランダムの数字の作成関数
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
