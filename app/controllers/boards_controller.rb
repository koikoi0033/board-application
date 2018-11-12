class BoardsController < ApplicationController
  # 掲示板一覧画面
  def index
    @boards = Board.all
  end

  # 掲示板新規登録画面
  def new
    @board = Board.new
  end
  
  # 掲示板データ登録アクション
  def create
    Board.create(board_params)

    # 掲示板一覧画面にリダイレクト
    redirect_to action: :index
  end

  # 掲示板詳細画面
  def show
    @board = Board.find(params[:id])
  end

  # パラメータを特定のキーにフィルタリング
  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
