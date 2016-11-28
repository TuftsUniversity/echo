require "savon"

module Whowas
  class Bluecat
    # Whowas::Adapter provides the public interface to your API, accessed through the
    # "search" instance method.
    include Whowas::Adapter
    
    @@client = nil
    @@cookie = nil
    
    # Bluecat API configuration
    CONFIG = {
      id: ENV['BLUECAT_ID'],
      wsdl: ENV['BLUECAT_WSDL'], # absolute path in dotenv
      username: ENV['BLUECAT_USERNAME'],
      password: ENV['BLUECAT_PASSWORD']
    }

    private
    
    ## Required
    
    # Sends a search query with provided input to your API and returns results 
    # as a string.
    def search_api(input)
      response = client.call(
        :get_mac_address, 
        message: 
          { configurationId: CONFIG[:id], macAddress: input[:mac] }, 
          cookies: @@cookie
      )
      
      ## LOG TO SYSLOG
      if Rails.configuration.syslogger
        Rails.configuration.syslogger.tagged("INFOSEC-ECHO") do
          Rails.configuration.syslogger.info "Echo queried Bluecat Proteus for a MAC address."
        end
      end
      
      response.body[:get_mac_address_response][:return][:properties] rescue ""
    end

    def client
      if @@client.nil? || @@cookie.nil?
        @@client = Savon.client(ssl_verify_mode: :none, wsdl: File.expand_path(CONFIG[:wsdl], __FILE__))
        response = @@client.call :login do 
          message username: CONFIG[:username], password: CONFIG[:password]
        end
        
        ## LOG TO SYSLOG
        if Rails.configuration.syslogger
          Rails.configuration.syslogger.tagged("INFOSEC-ECHO") do        
            Rails.configuration.syslogger.info "Echo logged into Bluecat Proteus."
          end
        end
        
        @@cookie = response.http.cookies
      end
      @@client
    rescue StandardError => e
    
      ## LOG TO SYSLOG
      if Rails.configuration.syslogger
        Rails.configuration.syslogger.tagged("INFOSEC-ECHO") do
          Rails.configuration.syslogger.error "Echo failed to login to Bluecat Proteus."
        end
      end
      
      raise Whowas::Errors::ServiceUnavailable, "#{self.class.name}: #{e}"      
    end        
   
    ## Optional
    
    # Validates input to avoid unnecessary API calls.
    # MUST return true or raise a Whowas::Errors::InvalidInput error.
    # Replace "true" with your validation code.
    def validate(input)
      (input[:mac] && true) ||
      (raise Whowas::Errors::InvalidInput, "Invalid input for Bluecat")
    end
    
    # Transforms input one last time before API call.
    # Will be called on input for all search_methods using this adapter.
    # For search_method-specific transformations, use the format_input method
    # in your search_method.
    def format(input)
      input
    end
  end
end