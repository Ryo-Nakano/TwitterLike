class Users::RegistrationsController < Devise::RegistrationsController
  protected

  #Updateが終わったときに飛ばされるページ
  def after_update_path_for(resource)#読み込みが終わったら任意のページに飛ばされるって感じかな！
    tweets_mypage_path#更新が済んだらtweets_controllerのmypageアクションを呼ぶ→マイページに戻る！
  end
end
