require 'open-uri'
class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').map { |letter| letter }.sample(10)
  end

  def score
    @new = params[:new]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/:#{@new}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    @new_splitted = @new.chars
    if @letters.include?(@new_splitted.all?) == false
      @score = "sorry but #{@new} can't be built out of #{@letters}"
    elsif @letters.include?(@new) && user["found"] == false
      @score = "Sorry but #{@new} does not seem to be english word"
  end
end
end
