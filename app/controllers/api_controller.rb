class ApiController < ApplicationController

  # REST API Endpoint.

  #
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
    if last_entry && last_entry == existing_ip_entry
      last_entry.times_received += 1
      # last_entry.email_sent = false
      last_entry.save!
      render text: "No changes - The received IP address is '#{received_address}. Received #{existing_ip_entry.times_received} times", status: :ok
    else
      # It is a change. It could be an address existing in the past, or a new one:
      # Control for errors:
      begin
        if existing_ip_entry
          existing_ip_entry.times_received += 1
          message = 'Old address used again!'
        else
          existing_ip_entry = IpAddress.new ip_address: received_address, times_received: 1
          message = 'New address!'
        end
        existing_ip_entry.save!
        # Email notification - it is a change:
        NotificationEmail.change_of_ip_email(received_address).deliver_now
        existing_ip_entry.update_columns(email_sent: true)
        render text: "#{message} - The received IP address is '#{received_address}", status: :ok
      rescue Exception => e
        render text: "#{message} - Received '#{received_address} - Problems happened: [#{e}]", status: :ok
      end
    end
  end

end
