class User < ActiveRecord::Base

  # Included default devise modules.
  #   Others available: :confirmable, :lockable,
  #   :rememberable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :recoverable,
         :trackable,                :validatable

end
