class User < ApplicationRecord

# アソシエーション(1:多)
has_many :tweets#tweetsと紐づいてるよってことを明示！

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end