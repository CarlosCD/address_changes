class ApiController < ApplicationController

  # API Endpoint (GET only, for simplicity).

  # Example for testing the API:
  #   Run the development app with:
  #     rails s --binding=0.0.0.0
  #   Then:
  #     curl localhost:3000/notify
  #
  def receive_ip_address
    received_address = request.remote_ip
    alerts = IpAddress.order(updated_at: :desc)
    last_entry = alerts.first
    existing_ip_entry = alerts.where(ip_address: received_address).first
    message = "Received '#{received_address}'"
    # Control for errors:
    begin
      if last_entry && last_entry == existing_ip_entry
        # Nothing has changed, no notification email
        last_entry.times_received += 1
        message << " - No changes. Received #{last_entry.times_received} times"
        # Part that could err, maybe:
        last_entry.save!
        render text: message, status: :ok
      else
        # It is a change, so it will send an email.
        # It could be an address existing in the past, or a new one, but I will register as a new entry
        message << (existing_ip_entry ? ' - Old IP address reused!' : ' - New IP address!')
        # Part that could err, maybe:
        ip_entry = IpAddress.create! ip_address: received_address, times_received: 1
        # Email notification:
        NotificationEmail.change_of_ip_email(received_address).deliver_now
        ip_entry.update_columns(email_sent: true)
        render text: message, status: :ok
      end
    rescue Exception => e
      render text: "#{message} - Problems happened :( [#{e}]", status: :ok
    end
  end

end
