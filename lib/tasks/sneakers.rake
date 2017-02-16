namespace :sneakers do
  desc "run sneakers with eager loading"
  task run2: :environment do
    ::Rails.application.eager_load!
    Rake::Task['sneakers:run'].invoke
  end

end
