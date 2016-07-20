class AnagramsController < ApplicationController

  def index
    render json: Anagram.for(params[:words])
  end
end
