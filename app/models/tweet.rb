class Tweet < ApplicationRecord

  # アソシエーション(1:多)
  belongs_to :user#userと紐づいてるよ！ってことを明示！
end
