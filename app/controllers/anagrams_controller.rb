class AnagramsController < ApplicationController

  def index
    render json: { beta: ['beat', 'abet'] }
  end
end
