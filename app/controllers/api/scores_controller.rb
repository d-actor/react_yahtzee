class Api::ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @scores = Score.all.order(value: :desc)
  end

  # Without JBuilder
  # def create
  #   score = current_user.scores.new(score_params)
  #   if score.save
  #     render json: { 
  #       email: current_user.email, 
  #       score: score.value, 
  #       nickname: current_user.nickname, 
  #       created_at: score.created_at
  #     }
  #   else
  #     json_error(score)
  #   end
  # end

  # With JBuilder
  def create
    @score = current_user.scores.new(score_params)

    if @score.save
      render 'show'
    else
      json_error(@score)
    end
  end

  private
    def score_params
      params.require(:score).permit(:value)
    end
end
