# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_fedex_crossborder'
  s.version     = '0.0.24'
  s.summary     = 'FedEx Crossborder integration'
  s.description = 'FedEx Crossborder integration to handle international shipping.'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Edwin Horneij'
  s.email     = 'edwin@astekwallcovering.com'
  s.homepage  = 'https://www.designyourwall.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.4'

  # MaxMind geolocation
  s.add_dependency 'geoip2'

  # Savon SOAP library for API calls to FedEx Crossborder
  # s.add_dependency 'savon', '~> 2.11.0'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
