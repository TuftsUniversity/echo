Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.syslogger = Syslogger.new("INFOSEC-ECHO")
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  # add time to lograge
  config.lograge.custom_options = lambda do |event|
    {:time => event.time}
  end  
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_record.dump_schema_after_migration = false
  config.middleware.use Rack::Deflater
end
Rack::Timeout.timeout = (ENV["RACK_TIMEOUT"] || 10).to_i
