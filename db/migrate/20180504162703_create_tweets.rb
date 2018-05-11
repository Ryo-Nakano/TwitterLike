class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    # =========================
    # カラムはここに記載される
    # →テーブルにカラムを追加！
    # =========================
    create_table :tweets do |t|
      t.text :body
      t.timestamps
    end
  end
end
