require "open-uri"
class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    url = "https://dictionary.lewagon.com/#{@answer}"
    @response = URI.open(url).read
    @response = JSON.parse(@response)
    @english_word = @response

    if @english_word["found"] == true
      @results = "You Won!"
    elsif
      @results = "You lose!"
    end
    raise
  end
end
