Spree FedEx CrossBorder
=======================

FedEx Crossborder integration to handle international shipping.

Installation
------------

Add spree_fedex_crossborder to your Gemfile:

```ruby
gem 'spree_fedex_crossborder'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_fedex_crossborder:install
```

Setup/Configuration
-------------------

Requires the following environment values to be set:

```
FEDEX_CROSSBORDER_CHECKOUT_SECURITY_URL
FEDEX_CROSSBORDER_CHECKOUT_PARTNER_URL
FEDEX_CROSSBORDER_USERNAME
FEDEX_CROSSBORDER_PASSWORD
FEDEX_CROSSBORDER_PARTNER_KEY

MAXMIND_USER_ID
MAXMIND_LICENSE_KEY
```

Requires `config.fedex_crossborder_exchange_rate_url = 'https://partnertools.bongous.com/currency/exchanges.json?key='` setting in config/application.rb .

Requires a scheduled task on server to execute `update_exchange_rates` once a day.

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_fedex_crossborder/factories'
```

Copyright (c) 2016 Astek Wallcovering Inc, released under the New BSD License
