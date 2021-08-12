class TodolistsController < ApplicationController

  def new
    @list = List.new
  end

  # 以下を追加
  def create
    # １. データを新規登録するためのインスタンス作成
    #list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    #list.save
    # ３. トップ画面へリダイレクト
   # redirect_to todolist_path(list.id)

    @list=List.new(list_params)
    #対象のカラムにデータが入力されれば、saveメソッドで
    #trueが返される
    #対象のカラムにデータが入力されていなければ、saveメソッドでfalseが返される

    if @list.save
      redirect_to todolist_path(@list.id)
    else

      #render:アクション名で、同じコントローラー内の別アクションをview
      #viewを表示できる
      render :new
    end
  end

  def index
    #Listというモデルのデータを全て取り出す
    @lists = List.all
  end

  def show
    #特定のidのデータを取得
    @list=List.find(params[:id])
  end

  def edit
    @list=List.find(params[:id])
  end

  def update
    list=List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)

  end



  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

  def list_params
   params.require(:list).permit(:title, :body, :image)
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

