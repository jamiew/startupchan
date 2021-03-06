class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  after_create :send_email

  def can_edit?(entry)
    user.admin? || entry.creator == self
  end

protected

  def send_email
    Notifier.user_signup_notification(self).deliver
  end

end
