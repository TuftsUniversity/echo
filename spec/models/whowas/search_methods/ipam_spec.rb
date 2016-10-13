require "rails_helper"

module Whowas
  describe Ipam, type: :whowas do
    it_behaves_like "a_search_method", {
        valid: { mac: "01:23:45:67:89:ab" },
        missing: {},
        invalid: [
          { mac: "not_a_mac_address" }
        ],
        adapter_required_keys: [],
        valid_result: "A string with stuff including a reg_by=username etc"
      }
  end
end
