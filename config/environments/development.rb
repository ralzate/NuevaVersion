Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true


  # Defining default url options for devise
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Change to true to allow email to be sent during development
  # http://stackoverflow.com/questions/21610815/how-to-config-devise-gem-to-send-email-to-the-resource
  ActionMailer::Base.delivery_method=:smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "gmail.com",
  :authentication => :login,
  :user_name => "alejoalzate12@gmail.com",
  :password => "Alejoalzategems1995",
  :enable_starttls_auto => true
}
ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.raise_delivery_errors = true 
ActionMailer::Base.default :charset => "utf-8"
ActionMailer::Base.default :content_type => "text/html"
#ActionMailer::Base.default_url_options[:host] = "104.236.72.106"


end
