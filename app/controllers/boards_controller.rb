class BoardsController < ApplicationController

  # 共通メソッドのbefore_action
  before_action :set_target_board, only: %i[show edit update destroy]

  # 掲示板一覧画面
  def index
    @boards = Board.page(params[:page])
  end

  # 掲示板新規登録画面
  def new
    @board = Board.new(flash[:board])
  end

  # 掲示板データ登録アクション
  def create
    board = Board.new(board_params)
    if board.save
      # 掲示板一覧画面にリダイレクト
      redirect_to board, notice: "「#{board.title}」の投稿を作成しました"
    else
      # 掲示板新規登録画面に入力パラメータとエラーメッセージを渡して
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  # 掲示板詳細画面
  def show
  end

  # 掲示板編集画面
  def edit
  end

  # 掲示板編集画面の更新処理
  def update
    @board.update(board_params)
    redirect_to @board
  end

  # 掲示板削除機能
  def destroy
    @board.delete
    redirect_to boards_path, notice: "「#{@board.title}」の投稿を削除しました"
  end

  private
  # フィルタリングした掲示板新規作成フォームの入力パラメータを取得する
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  #　対象の掲示板データを取得する
  def set_target_board
    @board = Board.find(params[:id])
  end
end
