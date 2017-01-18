FactoryGirl.define do
  factory :lockout do
    timestamp "2017-01-11 10:15:57"
    username "MyString"
    host "MyString"
  end
  factory :user do
    username "ldap_username"
  end

  factory :whowas_search do
    timestamp "2015-11-18 11:32:30"
    ip "192.168.1.1"
    port 80
    
    # valid input, no results
    factory :search_with_no_results do
      ip "120.39.21.44"
    end
    
    # invalid input
    factory :invalid_search do
      ip "abcdef"
    end
  end  
end
