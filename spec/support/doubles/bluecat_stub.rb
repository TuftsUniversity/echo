module Whowas
  module TestSupport
    def bluecat_up
      savon.mock!
    end
    
    def bluecat_down
      savon.unmock!
    end
  end
end