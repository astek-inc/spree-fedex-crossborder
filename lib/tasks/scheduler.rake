desc 'Get exchange rates from FedEx and enter them into database.'
task :update_exchange_rates => :environment do
  # puts 'Updating exchange rates...'
  Spree::ExchangeRate.fetch_updates
  # puts 'Done.'
end
