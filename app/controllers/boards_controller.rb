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
    board = Board.create(board_params)
    # 掲示板一覧画面にリダイレクト
    redirect_to board
  end

  # 掲示板詳細画面
  def show
    @board = Board.find(params[:id])
  end

  # 掲示板編集画面
  def edit
    @board = Board.find(params[:id])
  end

  # 掲示板編集画面の更新処理
  def update
    board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board
  end

  # 掲示板削除機能
  def destroy
    board = Board.find(params[:id])
    board.delete
    
    redirect_to boards_path
  end

  # パラメータを特定のキーにフィルタリング
  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
