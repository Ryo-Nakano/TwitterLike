class TweetsController < ApplicationController

  #ログインしていなかったら、このコントローラーの全ての機能を使えない
  before_action :authenticate_user!

  #全ての投稿を表示する画面
  def index
    #Orderで並べ替え
    @tweets = Tweet.all.order("id DESC")#Tweetを取得しつつ、並べ替え
    logger.debug("===================")
    logger.debug("TweetLoaded!")#これは呼ばれてるから、どうやらTweetの取得はできているっぽい？
    logger.debug(@tweets)#やっぱりここの中身無いみたい。どうすれば中身追加できる？
    # 中身の追加はできたけど、結局変数@tweetの中に値は取ってこれてない。なんで？
    logger.debug("===================")
  end

  #新しいTweetを投稿するときに使う
  def new
    @tweet = Tweet.new
    logger.debug("===============")
    logger.debug("New!!")
    logger.debug("===============")
  end

  def save
    #新しいTweetの保存に成功した場合
    if @tweet.save
      #index.html.erbにページが移る
      redirect_to action: "index"
      logger.debug("===============")
      logger.debug("Saved!!")
      logger.debug("===============")

    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
      logger.debug("===============")
      logger.debug("New Again!!")
      logger.debug("===============")
    end
  end



  #新しいTweetの保存
  # def create
  #   @tweet = Tweet.new(tweet_params)
  #   logger.debug("TweetCreated!!!")
  #   # @tweet = Tweet.create({id: "xxx", body: "xxxxxx", created_at: "YYYYMMDD"})
  # end
  def create
    @tweet = Tweet.new(tweet_params)

    #現在のUserのidをTweetのuser_idという部分にセット
    @tweet.user_id = current_user.id#これだけでいいんか！神！！

    #新しいTweetの保存に成功した場合
    if @tweet.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end

  #mypageの表示
  def mypage
    #アソシエーションを利用して、現在のユーザーが持っている全てのTweetを取得
    @tweets = current_user.tweets.order("id DESC")
  end


  private
  #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
