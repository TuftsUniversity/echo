module ErrorsHelper
  # :nocov:
  def humanize_error(error)
    case error.to_s
    when /no time information/
      "Could not understand timestamp format.  Please try again.  An example of a known valid format is \"August 25, 2016 10:00 AM EST\"."
    when /IPAddr::InvalidAddressError/
      "IP address is missing or invalid."
    when /Invalid input for Whowas::Firewall/
      "Invalid input for the first search query.  Note: a valid port is required for this IP address."
    else
      "An unknown error occured.  Please send an email to #{ENV["EMAIL"]} with the following message: #{error}."
    end
  end
  # :nocov:
end