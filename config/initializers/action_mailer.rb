if Rails.env.production?

	ActionMailer::Base.smtp_settings = {
	  :address  => ENV['SMTP_HOST'],
	  :port   => ENV['SMTP_PORT'],
	  :domain   => ENV['SMTP_DOMAIN'],
	  :user_name  => ENV['SMTP_USERNAME'],
	  :password => ENV['SMTP_PASSWORD']
	}

	ActionMailer::Base.delivery_method = :smtp

	ActionMailer::Base.default :from => ENV['SMTP_RECIPIENT']
	
end