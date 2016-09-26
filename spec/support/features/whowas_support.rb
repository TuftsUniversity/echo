module Features
  def visit_whowas_path
	  visit whowas_searches_path
  end
  
  def search_by_ip_and_port(ip, port, timestamp)
    fill_in "IP Address", with: ip
    fill_in "whowas_search_port", with: port
    fill_in "whowas_search_timestamp", with: timestamp
    click_on "Search"
  end
end
