Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret,
               'scope': 'email, profile',
               'prompt': 'select_account',
               'image_aspect_ratio': 'original',
               'image_size': 50,
               # hd: 'selleo.com',
               :client_options => {:ssl => {:ca_file => "/usr/share/curl/ca-bundle.crt"}}
  #Later, use env var: ENV['PATH_TO_SSL_FILE']
end