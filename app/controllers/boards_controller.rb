class BoardsController < ApplicationController
  def index
  end

  def new
    @board = Board.new
  end
  
  def create
    binding.pry
  end
end
