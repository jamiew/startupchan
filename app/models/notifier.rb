class Notifier < ActionMailer::Base
  default :from => "startupchan@gmail.com"

  # Sending this to admins right now, not the actual user who signed up (!)
  def user_signup_notification(user)
    mail(:to => "jamie@internetofdeath.com", :subject => "Startupchan user signup") do |format|
       format.text { render :text => "New user! ##{user.id} email=#{user.email.inspect}" }
       # format.html { render :text => "<h1>This is HTML</h1>" }
     end
  end

  def new_thread_notification(thread, user)
    # TODO
  end

  def new_reply_notification(post, user)
    # TODO
  end
end
