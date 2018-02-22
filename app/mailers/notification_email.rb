class NotificationEmail < ApplicationMailer

  def change_of_ip_email(new_ip_address)
    @new_ip_address = new_ip_address
    @user_email = (User.first) ?  User.first.email : 'from@example.com'
    addresses = IpAddress.order(updated_at: :desc)
    @previous_address = addresses.second.ip_address if addresses.count > 1
    mail(to: @user_email, from: @user_email, subject: "IP address (#{@new_ip_address})")
  end

end
