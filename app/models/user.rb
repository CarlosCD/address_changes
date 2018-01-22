class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, #:rememberable,
         :trackable, :validatable

  # Called by Devise to check if the user is enabled
  def active_for_authentication?
    super && self.enabled
  end

  # Called by Devise for the reason the user is not able to log in (disabled)
  def inactive_message
    enabled ? super : 'This user has been disabled, please contact another admin'
  end

end
