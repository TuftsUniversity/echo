require "rails_helper"

module Whowas
  describe Clearpass, type: :whowas do
    it_behaves_like "a_search_method", {
        valid: { mac: "00:ba:ce:1f:9b:31", timestamp: "April 19, 1985 20:24 EST" },
        missing: { mac: "00:ba:ce:1f:9b:31" },
        invalid: [
          { mac: "not_a_mac_address", timestamp: "April 19, 1985 20:24 EST" },
          { mac: "00:ba:ce:1f:9b:31", timestamp: "April 42, 1985 20:24 EST" },
        ],
        adapter_required_keys: [:query, :offset],
        valid_result: "A string including a RADIUS.Acct-Username=user field"
      }
  end
end
