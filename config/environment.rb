# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DateQuest::Application.initialize!
system "RAILS_ENV=development bin/delayed_job start"
