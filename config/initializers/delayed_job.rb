if Rails.env.development?
  system "RAILS_ENV=development script/delayed_job start"
elsif Rails.env.production?
  system "RAILS_ENV=production script/delayed_job start"
end
