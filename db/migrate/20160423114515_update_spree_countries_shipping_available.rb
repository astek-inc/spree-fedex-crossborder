class UpdateSpreeCountriesShippingAvailable < ActiveRecord::Migration
  def up
    supported_countries = [
        'AS', 'AO', 'AI', 'AM', 'AW', 'AZ', '1F', 'BS', '1A', 'BY', 'BJ', 'BT', 'BO', 'X1', 'BW', 'BG',
        'BF', 'CM', 'CV', 'KY', 'TD', 'CG', 'CK', 'HR', 'CW', 'DJ', 'EG', 'ER', 'ET', 'FO', 'FJ', 'GF',
        'PF', 'GA', 'GM', 'GE', 'GH', 'GI', 'GR', 'GL', 'GU', 'GN', 'GY', 'HT', 'IS', 'CI', 'KZ', 'KG',
        'LA', 'LB', 'LS', 'LR', 'LT', 'MK', 'MG', '1G', 'MW', 'ML', 'MH', 'MR', 'MU', 'FM', 'MD', 'MN',
        'ME', 'MA', 'MZ', 'NC', 'NE', 'PW', 'PG', 'PT', 'RE', 'X8', 'SN', 'RS', 'SC', 'SI', 'BL', '1L',
        'XB', 'MF', '1K', 'VC', 'SR', 'SZ', 'TO', 'TN', 'UY', 'UZ', 'VU', 'VG', 'VI', 'WS', 'ZM', 'ZW',
        'AG', 'AR', 'AU', 'AT', 'BH', 'BD', 'BB', 'BE', 'BZ', 'BM', 'BA', 'BR', 'BN', 'BI', 'KH', 'CA',
        'CL', 'CN', 'CO', 'CR', 'CY', 'CZ', 'DK', 'DM', 'DO', 'EC', 'SV', 'EE', 'FI', 'FR', 'DE', 'GD',
        'GP', 'GT', 'HN', 'HK', 'HU', 'IN', 'ID', 'IE', 'IL', 'IT', 'JM', 'JP', 'JO', 'KE', 'KR', 'KW',
        'LV', 'LI', 'LU', 'MO', 'MY', 'MV', 'MT', 'MQ', 'MX', 'MC', 'MS', 'NA', 'NP', 'NL', 'NZ', 'NI',
        'NG', 'NO', 'OM', 'PK', 'PA', 'PY', 'PE', 'PH', 'PL', 'PR', 'QA', 'RO', 'RW', 'SA', '1C', 'SG',
        'SK', 'ZA', 'ES', 'LK', '1J', 'KN', 'LC', 'SE', 'CH', 'TW', 'TZ', 'TH', 'TG', 'TT', 'TR', 'TC',
        'UG', 'AE', 'GB', 'US', 'VE', 'VN', '1B'
    ]

    Spree::Country.update_all(shipping_available: false)
    Spree::Country.where(iso: supported_countries).update_all(shipping_available: true)
  end

  def down
    # Can't undo
  end
end
