module Support
  def stub_whowas_methods
    allow(::Whowas).to receive(:search).and_return(
      { input: { 
          username: "",
          timestamp: ""
        },
        results: [
          {"service 1" => "Whowas::InvalidInput: Invalid IP Address"}
        ]
      })
           
    allow(::Whowas).to receive(:search).with({:timestamp=>Time.parse("2015-11-18 11:32:30").to_s, :ip=>"192.168.1.1", :port=>"80"}).and_return(
      { input: { 
          username: "johndoe1",
          timestamp: "2015-11-18 11:32:30"
        },
        results: [
          {"service 1" => "raw log 1"},
          {"service 2" => "raw log 2"}
        ]
      })
      
    allow(::Whowas).to receive(:search).with({:timestamp=>Time.parse("2015-11-18 11:32:30").to_s, :ip=>"120.39.21.44", :port=>"80"}).and_return(
      { input: { 
          username: "",
          timestamp: "2015-11-18 11:32:30"
        },
        results: [
          {"service 1" => "No results found."}
        ]
      })          
  end
end