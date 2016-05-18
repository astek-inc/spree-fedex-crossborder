class UpdateSpreeCountriesShippingAvailable < ActiveRecord::Migration
  def up
    supported_countries = ['AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM',
     'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'KH', 'CM', 'CA', 'CV', 'KY', 'TD', 'CL', 'CN', 'CX',
     'CC', 'CO', 'CG', 'CK', 'CR', 'SX', 'HR', 'CW', 'CY', 'CZ', 'TL', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'ER', 'EE', 'ET',
     'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GN', 'GY',
     'HT', 'HM', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IQ', 'IE', 'IM', 'IL', 'IT', 'CI', 'JM', 'JP', 'JO', 'KZ', 'KE', 'KR', 'KW',
     'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR',
     'MU', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'ZZ', 'NA', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NF', 'MP',
     'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'SS', 'RE', 'RO', 'RW', 'GS', 'SH',
     'WS', 'SM', 'SA', 'SN', 'RS', 'SC', 'SG', 'SK', 'SI', 'ZA', 'ES', 'LK', 'BL', 'XB', 'KN', 'LC', 'MF', 'MM', 'PM', 'VC', 'SR',
     'SJ', 'SZ', 'SE', 'CH', 'TW', 'TZ', 'TH', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TC', 'UG', 'AE', 'GB', 'US', 'UY', 'UZ', 'VU',
     'VA', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'WS', 'YE', 'ZM', 'ZW',
    ]

    Spree::Country.update_all(shipping_available: false)
    Spree::Country.where(iso: supported_countries).update_all(shipping_available: true)
  end

  def down
    # Can't undo
  end
end
