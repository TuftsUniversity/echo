require "rails_helper"

module Whowas
  describe Vpn, type: :whowas do
    it_behaves_like "a_search_method", {
        valid: { ip: "192.168.0.1", timestamp: "April 19, 1985 20:24 EST" },
        missing: { ip: "192.168.0.1" },
        invalid: [
          { ip: "not_an_ip_address", timestamp: "April 19, 1985 20:24 EST" },
          { ip: "192.168.0.1", timestamp: "April 42, 1985 20:24 EST" },
        ],
        adapter_required_keys: [:query, :offset],
        valid_result: "A string with stuff including a User username"
      }
  end
end
