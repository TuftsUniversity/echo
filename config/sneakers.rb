before_fork do |server, worker|
  # other settings
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection_pool.disconnect!
  end
end

after_fork do |server, worker|
  # other settings
  if defined?(ActiveRecord::Base)
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool']            =   ENV['DB_POOL'] || 5
    ActiveRecord::Base.establish_connection(config)
  end
end