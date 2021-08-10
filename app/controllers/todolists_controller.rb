class TodolistsController < ApplicationController

  def new
    @list = List.new
  end

  # 以下を追加
  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end






=begin
エラーが出る文
class TodolistsController < ApplicationController

  def new
    @lists=List.new
  end

  def create
     # １. データを新規登録するためのインスタンス作成
    list=List.new(list_params)

    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save

     # ３. トップ画面へリダイレクト
    redirect_to '/top'
　end

private

# ストロングパラメータ
#permit:paramsで取得した物のうちデータベースに保存する物を許可する
　def list_params
 　 params.require(:list).permit(:title, :body)
　end
end
=end

