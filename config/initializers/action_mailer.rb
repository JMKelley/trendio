if Rails.env.production?

	ActionMailer::Base.smtp_settings = {
	    :port =>           '587',
	    :address =>        'smtp.mandrillapp.com',
	    :user_name =>      ENV['MANDRILL_USERNAME'],
	    :password =>       ENV['MANDRILL_APIKEY'],
	    :domain =>         'hashtagg.tv',
	    :authentication => :plain
	}
	ActionMailer::Base.delivery_method = :smtp

	ActionMailer::Base.default :from => ENV['SMTP_RECIPIENT']
	
end