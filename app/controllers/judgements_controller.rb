class JudgementsController < ApplicationController
  def index
    @judgements = Judgement.all
  end

  def show
    @judgement = Judgement.find(params[:id])
  end


end
