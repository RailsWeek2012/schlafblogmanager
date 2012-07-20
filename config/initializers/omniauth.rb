Rails.application.config.middleware.use OmniAuth::Builder do
	provider :cas, host: 'cas.thm.de/cas'#, local_url: '/cas/login'
end
