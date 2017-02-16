Sneakers.configure({
  :amqp => 'amqp://arcsight:DzW2eyw6qtD@rabbitmq-prod-01.uit.tufts.edu:5672',
  :workers => 1
})
Sneakers.logger.level = Logger::WARN # the default DEBUG and INFO is too noisy
