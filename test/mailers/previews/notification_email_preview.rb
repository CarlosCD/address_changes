# Preview all emails at http://localhost:3000/rails/mailers/notification_email
class NotificationEmailPreview < ActionMailer::Preview
  def change_of_ip_email_preview
    address = IpAddress.order(updated_at: :desc).first
    address = address ? address.ip_address : 'none'
    NotificationEmail.change_of_ip_email(address)
  end
end
