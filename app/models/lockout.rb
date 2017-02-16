class Lockout < ApplicationRecord
  scope :in_last, -> (range) { where(timestamp: (Time.now - range)..Time.now) }
  scope :by_newest, -> { order("timestamp DESC") }
  scope :for_user, -> (username) { where(username: username) }
    
  scope :top_users, lambda { |num|
    group("username").order("count_username DESC").count("username").take(num)
  }

  scope :top_hosts, lambda { |num|
    group("host").order("count_host DESC").count("host").take(num)
  }  

  def formatted_timestamp
    self.timestamp.strftime("%Y/%m/%e %I:%M %p")
  end
end
