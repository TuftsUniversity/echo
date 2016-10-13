class WhowasSearch
  include ActiveModel::Model
  
  attr_accessor :timestamp, :ip, :port
  attr_accessor :username, :results
  attr_accessor :error
  
  def search!
    search = Whowas.search(input)
    self.results = search[:results]
    self.username = search[:input][:username]
    self.error = search[:error]
  rescue StandardError => e
    self.error = e.inspect
  end
  
  private
  
  def input
    {
      timestamp: Time.parse(timestamp).to_s,
      ip: ip,
      port: port.to_s
    }.delete_if { |key, value| (value.nil? || value.empty? rescue false) }
  end
end
