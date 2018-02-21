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
    existing_entry = IpAddress.where(ip_address: received_address).order(:updated_at).first
    if existing_entry
      existing_entry.times_received += 1
      existing_entry.email_sent = false
      existing_entry.save!
      render text: "No changes - The received IP address is '#{received_address}. Received #{existing_entry.times_received} times", status: :ok
    else
      new_alert = IpAddress.new ip_address: received_address, times_received: 1
      new_alert.save!
      # Here send an email, control for errors:
      # if email_sent
      #   new_alert.update_columns(email_sent: true)
      # end
      render text: "New address! - The received IP address is '#{received_address}", status: :ok
    end
  end

end
