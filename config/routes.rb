Rails.application.routes.draw do

  #devise(railsに認証機能を簡単につけることができるgem)じゃなくて自作のregistration_controllerを使いたいからここで宣言！
  devise_for :users, :controllers =>{
    :registrations => "users/registrations"
  }

  # devise_for :users, :controllers => {
  #   :registrations => "users/registrations"
  # }

  root to: "hello#index"
  # rootはURLの"/"に対応！”→"/"というURLでアクセスがあった時にhello_controllerアクションを使ってね！てこと！

  # Tweetの投稿に関するページ
  # 投稿ページ表示
  get "/tweets/new" => "tweets#new"
  # 投稿しホームにリダイレクト
  post "/tweets/new" => "tweets#create"
  # 投稿一覧
  get "/tweets/index" => "tweets#index"
  #mypageに移動
  get "/tweets/mypage" => "tweets#mypage"
  # HTTPリクエスト URL => コントローラー#アクション

end
