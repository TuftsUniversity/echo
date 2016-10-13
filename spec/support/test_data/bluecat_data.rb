module Whowas
  module TestSupport 
    # :nocov:
    def valid_bluecat_input
      { 
        mac: "01:23:45:67:89:ab"
      }
    end
    
    def formatted_valid_splunk_input
      { 
        query: "search 192.168.1.1 5000",
        args: {
          earliest_time: Time.parse("2015-10-09T23:55:00+0000").localtime.strftime("%Y-%m-%dT%H:%M:%S.%L%z"),
          latest_time: Time.parse("2015-10-10T00:00:00.100+0000").localtime.strftime("%Y-%m-%dT%H:%M:%S.%L%z")
        }
      }      
    end

    def valid_bluecat_input_no_results
      { 
        mac: "aa:bb:cc:dd:ee:ff"
      }
    end
    
    def formatted_valid_splunk_input_no_results
      { 
        query: "search 192.168.1.2 5000",
        args: {
          earliest_time: Time.parse("2015-10-09T23:55:00+0000").localtime.strftime("%Y-%m-%dT%H:%M:%S.%L%z"),
          latest_time: Time.parse("2015-10-10T00:00:00.100+0000").localtime.strftime("%Y-%m-%dT%H:%M:%S.%L%z")
        }
      }      
    end
    
    def invalid_bluecat_input
      {
        ip: "192.168.1.1"
      }
    end
  end
end
