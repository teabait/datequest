if Rails.env.development?
  system "RAILS_ENV=development bin/delayed_job start"
elsif Rails.env.production?
  system "RAILS_ENV=production bin/delayed_job start"
end
