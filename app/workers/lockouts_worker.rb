class LockoutsWorker
  include Sneakers::Worker

  from_queue "echo2.lockouts", env: nil

  def work(raw)
    hash = {}    
    raw = raw.split('&')
    raw.each do |r|
      k,v = r.split('=')

      hash[k] = v
    end

    puts hash
    message_type = hash.delete("message_type")
    Lockout.create(hash)
    ack!
  end
end
