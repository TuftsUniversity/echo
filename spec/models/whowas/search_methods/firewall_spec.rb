require "rails_helper"

module Whowas
  describe Firewall, type: :whowas do
    it_behaves_like "a_search_method", {
        valid: { ip: "192.168.0.1", port: 5000, timestamp: "April 19, 1985 20:24 EST" },
        missing: { ip: "192.168.0.1", timestamp: "2016-08-15T10:00-0400" },
        invalid: [
          { ip: "not_an_ip_address", port: 5000, timestamp: "April 19, 1985 20:24 EST" },
          { ip: "192.168.0.1", port: -1, timestamp: "April 19, 1985 20:24 EST" },
          { ip: "192.168.0.1", port: 5000, timestamp: "April 42, 1985 20:24 EST" },
        ],
        adapter_required_keys: [:query, :offset],
        valid_result: "A string with stuff including a Secure-Wireless-10.10.0.1 address"
      }
  end
end
