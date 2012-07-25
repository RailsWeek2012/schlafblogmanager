Rails.application.config.middleware.use OmniAuth::Builder do
	provider :cas, host: 'cas.thm.de/cas'
end
