CONFIG = YAML.load_file(Rails.root.join('config', 'apikeys.yml'))

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, CONFIG[:Twitter][:ConsumerKey], CONFIG[:Twitter][:ConsumerSecret]
end
