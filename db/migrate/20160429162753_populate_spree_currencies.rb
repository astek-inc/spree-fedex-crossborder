class PopulateSpreeCurrencies < ActiveRecord::Migration
  def up
    [
        { :name => 'Afghan Afghani', :code => 'AFN', :symbol => '؋', :symbol_position => 'before' },
        { :name => 'Albanian Lek', :code => 'ALL', :symbol => 'Lek', :symbol_position => 'before' },
        { :name => 'Algerian Dinar', :code => 'DZD', :symbol => 'د.ج', :symbol_position => 'before' },
        { :name => 'Angolan Kwanza', :code => 'AOA', :symbol => 'Kz', :symbol_position => 'before' },
        { :name => 'Argentine Peso', :code => 'ARS', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Armenian Dram', :code => 'AMD', :symbol => '', :symbol_position => 'before' },
        { :name => 'Aruban Guilder', :code => 'AWG', :symbol => 'ƒ', :symbol_position => 'before' },
        { :name => 'Australian Dollar', :code => 'AUD', :symbol => 'A$', :symbol_position => 'before' },
        { :name => 'Azerbaijani Manat', :code => 'AZN', :symbol => 'ман', :symbol_position => 'before' },
        { :name => 'Bahamian Dollar', :code => 'BSD', :symbol => 'B$', :symbol_position => 'before' },
        { :name => 'Bahraini Dinar', :code => 'BHD', :symbol => '.د.ب', :symbol_position => 'before' },
        { :name => 'Bangladeshi Taka', :code => 'BDT', :symbol => '৳', :symbol_position => 'before' },
        { :name => 'Barbados Dollar', :code => 'BBD', :symbol => 'Bds$', :symbol_position => 'before' },
        { :name => 'Belarussian Ruble', :code => 'BYR', :symbol => 'Br', :symbol_position => 'before' },
        { :name => 'Belize Dollar', :code => 'BZD', :symbol => 'BZ$', :symbol_position => 'before' },
        { :name => 'Bermudian Dollar', :code => 'BMD', :symbol => 'BD$', :symbol_position => 'before' },
        { :name => 'Bhutanese Ngultrum', :code => 'BTN', :symbol => 'Nu.', :symbol_position => 'before' },
        { :name => 'Bolivian Boliviano', :code => 'BOB', :symbol => 'Bs.', :symbol_position => 'before' },
        { :name => 'Bosnia and Herzegovina Convertible Mark', :code => 'BAM', :symbol => 'KM', :symbol_position => 'before' },
        { :name => 'Botswanan Pula', :code => 'BWP', :symbol => 'P', :symbol_position => 'before' },
        { :name => 'Brazilian Real', :code => 'BRL', :symbol => 'R$', :symbol_position => 'before' },
        { :name => 'Brunei Dollar', :code => 'BND', :symbol => 'B$', :symbol_position => 'before' },
        { :name => 'Bulgarian Lev', :code => 'BGN', :symbol => 'лв.', :symbol_position => 'before' },
        { :name => 'Burundi Franc', :code => 'BIF', :symbol => 'FBu', :symbol_position => 'before' },
        { :name => 'CFP Franc', :code => 'XPF', :symbol => 'F', :symbol_position => 'before' },
        { :name => 'Cambodian Riel', :code => 'KHR', :symbol => '៛', :symbol_position => 'before' },
        { :name => 'Canadian Dollar', :code => 'CAD', :symbol => 'C$', :symbol_position => 'before' },
        { :name => 'Cape Verde Escudo', :code => 'CVE', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Cayman Islands Dollar', :code => 'KYD', :symbol => 'CI$', :symbol_position => 'before' },
        { :name => 'Central African CFA Franc', :code => 'XAF', :symbol => 'FCFA', :symbol_position => 'before' },
        { :name => 'Chilean Peso', :code => 'CLP', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Colombian Peso', :code => 'COP', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Comoro Franc', :code => 'KMF', :symbol => 'CF', :symbol_position => 'before' },
        { :name => 'Congolese Franc', :code => 'CDF', :symbol => 'FC', :symbol_position => 'before' },
        { :name => 'Costa Rican Colón', :code => 'CRC', :symbol => '₡', :symbol_position => 'before' },
        { :name => 'Croatian Kuna', :code => 'HRK', :symbol => 'kn', :symbol_position => 'before' },
        { :name => 'Cuban Peso Convertible', :code => 'CUC', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Czech Koruna', :code => 'CZK', :symbol => 'Kč', :symbol_position => 'before' },
        { :name => 'Nicaraguan Córdoba', :code => 'NIO', :symbol => 'C$', :symbol_position => 'before' },
        { :name => 'Danish Krone', :code => 'DKK', :symbol => 'kr.', :symbol_position => 'before' },
        { :name => 'Djibouti Franc', :code => 'DJF', :symbol => 'Fdj', :symbol_position => 'before' },
        { :name => 'Dominican Peso', :code => 'DOP', :symbol => 'RD$', :symbol_position => 'before' },
        { :name => 'East Caribbean Dollar', :code => 'XCD', :symbol => 'EC$', :symbol_position => 'before' },
        { :name => 'Egyptian Pound', :code => 'EGP', :symbol => 'E£', :symbol_position => 'before' },
        { :name => 'Eritrean Nakfa', :code => 'ERN', :symbol => 'Nfk', :symbol_position => 'before' },
        { :name => 'Ethiopian Birr', :code => 'ETB', :symbol => 'Br', :symbol_position => 'before' },
        { :name => 'Euro', :code => 'EUR', :symbol => '€', :symbol_position => 'before' },
        { :name => 'Falkland Islands Pound', :code => 'FKP', :symbol => 'FK£', :symbol_position => 'before' },
        { :name => 'Fiji Dollar', :code => 'FJD', :symbol => 'FJ$', :symbol_position => 'before' },
        { :name => 'Gambian Dalasi', :code => 'GMD', :symbol => 'D', :symbol_position => 'before' },
        { :name => 'Georgian Lari', :code => 'GEL', :symbol => '', :symbol_position => 'before' },
        { :name => 'Ghana Cedi', :code => 'GHS', :symbol => 'GH₵', :symbol_position => 'before' },
        { :name => 'Gibraltar Pound', :code => 'GIP', :symbol => '£', :symbol_position => 'before' },
        { :name => 'Guatamalan Quetzal', :code => 'GTQ', :symbol => 'Q', :symbol_position => 'before' },
        { :name => 'Guernsey Pound', :code => 'GGP', :symbol => '£', :symbol_position => 'before' },
        { :name => 'Guinea Franc', :code => 'GNF', :symbol => 'FG', :symbol_position => 'before' },
        { :name => 'Guyana Dollar', :code => 'GYD', :symbol => 'G$', :symbol_position => 'before' },
        { :name => 'Haitian Gourde', :code => 'HTG', :symbol => 'G', :symbol_position => 'before' },
        { :name => 'Honduran Lempira', :code => 'HNL', :symbol => 'L', :symbol_position => 'before' },
        { :name => 'Hong Kong Dollar', :code => 'HKD', :symbol => 'HK$', :symbol_position => 'before' },
        { :name => 'Hungarian Forint', :code => 'HUF', :symbol => 'Ft', :symbol_position => 'before' },
        { :name => 'Icelandic Króna', :code => 'ISK', :symbol => 'kr', :symbol_position => 'before' },
        { :name => 'Indian Rupee', :code => 'INR', :symbol => 'Rs', :symbol_position => 'before' },
        { :name => 'Indonesian Rupiah', :code => 'IDR', :symbol => 'Rp', :symbol_position => 'before' },
        { :name => 'Iranian Rial', :code => 'IRR', :symbol => '﷼', :symbol_position => 'before' },
        { :name => 'Iraqi Dinar', :code => 'IQD', :symbol => 'ع.د', :symbol_position => 'before' },
        { :name => 'Isle of Man Pound', :code => 'IMP', :symbol => '£', :symbol_position => 'before' },
        { :name => 'Israeli New Shekel', :code => 'ILS', :symbol => '	₪', :symbol_position => 'before' },
        { :name => 'Jamaican Dollar', :code => 'JMD', :symbol => 'J$', :symbol_position => 'before' },
        { :name => 'Japanese Yen', :code => 'JPY', :symbol => '¥', :symbol_position => 'before' },
        { :name => 'Jersey Pound', :code => 'JEP', :symbol => '£', :symbol_position => 'before' },
        { :name => 'Jordanian Dinar', :code => 'JOD', :symbol => '', :symbol_position => 'before' },
        { :name => 'Kazakhstani Tenge', :code => 'KZT', :symbol => '₸', :symbol_position => 'before' },
        { :name => 'Kenyan Shilling', :code => 'KES', :symbol => 'KSh', :symbol_position => 'before' },
        { :name => 'Krone', :code => 'NOK', :symbol => 'kr', :symbol_position => 'before' },
        { :name => 'Kuwaiti Dinar', :code => 'KWD', :symbol => 'د.ك', :symbol_position => 'before' },
        { :name => 'Kyrgyzstani Som', :code => 'KGS', :symbol => '', :symbol_position => 'before' },
        { :name => 'Lao Kip', :code => 'LAK', :symbol => '₭', :symbol_position => 'before' },
        { :name => 'Lebanese Pound', :code => 'LBP', :symbol => 'ل.ل', :symbol_position => 'before' },
        { :name => 'Lesotho Loti', :code => 'LSL', :symbol => 'M', :symbol_position => 'before' },
        { :name => 'Liberian Dollar', :code => 'LRD', :symbol => 'L$', :symbol_position => 'before' },
        { :name => 'Libyan Dinar', :code => 'LYD', :symbol => 'LD', :symbol_position => 'before' },
        { :name => 'Macanese Pataca', :code => 'MOP', :symbol => 'MOP$', :symbol_position => 'before' },
        { :name => 'Macedonian Denar', :code => 'MKD', :symbol => 'ден', :symbol_position => 'before' },
        { :name => 'Malagasy Ariary', :code => 'MGA', :symbol => 'Ar', :symbol_position => 'before' },
        { :name => 'Malawian Kwacha', :code => 'MWK', :symbol => 'MK', :symbol_position => 'before' },
        { :name => 'Malaysian Ringgit', :code => 'MYR', :symbol => 'RM', :symbol_position => 'before' },
        { :name => 'Maldivian Rufiyaa', :code => 'MVR', :symbol => 'Rf', :symbol_position => 'before' },
        { :name => 'Mauritanian Ouguiya', :code => 'MRO', :symbol => 'UM', :symbol_position => 'before' },
        { :name => 'Mauritian Rupee', :code => 'MUR', :symbol => '₨', :symbol_position => 'before' },
        { :name => 'Mexican Peso', :code => 'MXN', :symbol => 'Mex$', :symbol_position => 'before' },
        { :name => 'Moldovan Leu', :code => 'MDL', :symbol => '', :symbol_position => 'before' },
        { :name => 'Mongolian Tögrög', :code => 'MNT', :symbol => '₮', :symbol_position => 'before' },
        { :name => 'Moroccan Dirham', :code => 'MAD', :symbol => 'MAD', :symbol_position => 'before' },
        { :name => 'Mozambican Metical', :code => 'MZN', :symbol => 'MT', :symbol_position => 'before' },
        { :name => 'Myanmar Kyat', :code => 'MMK', :symbol => 'K', :symbol_position => 'before' },
        { :name => 'Naira', :code => 'NGN', :symbol => '₦', :symbol_position => 'before' },
        { :name => 'Namibian Dollar', :code => 'NAD', :symbol => 'N$', :symbol_position => 'before' },
        { :name => 'Nepalese Rupee', :code => 'NPR', :symbol => 'Rs', :symbol_position => 'before' },
        { :name => 'Netherlands Antillean Guilder', :code => 'ANG', :symbol => 'NAƒ', :symbol_position => 'before' },
        { :name => 'New Zealand Dollar', :code => 'NZD', :symbol => 'NZ$', :symbol_position => 'before' },
        { :name => 'North Korean Won', :code => 'KPW', :symbol => '₩', :symbol_position => 'before' },
        { :name => 'Norwegian Krone', :code => 'NOK', :symbol => 'kr', :symbol_position => 'before' },
        { :name => 'Omani Rial', :code => 'OMR', :symbol => 'ر.ع.', :symbol_position => 'before' },
        { :name => 'Pakistani Rupee', :code => 'PKR', :symbol => 'Rs', :symbol_position => 'before' },
        { :name => 'Papua New Guinean Kina', :code => 'PGK', :symbol => 'K', :symbol_position => 'before' },
        { :name => 'Paraguayan Guaraní', :code => 'PYG', :symbol => '₲', :symbol_position => 'before' },
        { :name => 'Peruvian Nuevo Sol', :code => 'PEN', :symbol => 'S/', :symbol_position => 'before' },
        { :name => 'Philippine Peso', :code => 'PHP', :symbol => '	₱', :symbol_position => 'before' },
        { :name => 'Polish Złoty', :code => 'PLN', :symbol => 'zł', :symbol_position => 'before' },
        { :name => 'Pound Sterling', :code => 'GBP', :symbol => '£', :symbol_position => 'before' },
        { :name => 'Qatari Riyal', :code => 'QAR', :symbol => 'ريال', :symbol_position => 'before' },
        { :name => 'Romanian Leu', :code => 'RON', :symbol => '', :symbol_position => 'before' },
        { :name => 'Russian Ruble', :code => 'RUB', :symbol => '₽', :symbol_position => 'before' },
        { :name => 'Rwandan Franc', :code => 'RWF', :symbol => 'FRw', :symbol_position => 'before' },
        { :name => 'Saint Helena Pound', :code => 'SHP', :symbol => '£', :symbol_position => 'before' },
        { :name => 'Samoan Tālā', :code => 'WST', :symbol => 'WS$', :symbol_position => 'before' },
        { :name => 'Saudi Riyal', :code => 'SAR', :symbol => 'ر.س', :symbol_position => 'before' },
        { :name => 'Serbian Dinar', :code => 'RSD', :symbol => 'din.', :symbol_position => 'before' },
        { :name => 'Seychellois Rupee', :code => 'SCR', :symbol => '', :symbol_position => 'before' },
        { :name => 'Sierra Leonean Leone', :code => 'SLL', :symbol => 'Le', :symbol_position => 'before' },
        { :name => 'Singapore Dollar', :code => 'SGD', :symbol => 'S$', :symbol_position => 'before' },
        { :name => 'Solomon Islands Dollar', :code => 'SBD', :symbol => 'SI$', :symbol_position => 'before' },
        { :name => 'Somali Shilling', :code => 'SOS', :symbol => 'Sh.So.', :symbol_position => 'before' },
        { :name => 'South African Rand', :code => 'ZAR', :symbol => 'R', :symbol_position => 'before' },
        { :name => 'South Korean Won', :code => 'KRW', :symbol => '₩', :symbol_position => 'before' },
        { :name => 'South Sudanese Pound', :code => 'SSP', :symbol => '', :symbol_position => 'before' },
        { :name => 'Sri Lankan Rupee', :code => 'LKR', :symbol => 'රු', :symbol_position => 'before' },
        { :name => 'Sudanese Pound', :code => 'SDG', :symbol => 'ج.س.', :symbol_position => 'before' },
        { :name => 'Surinamese Dollar', :code => 'SRD', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Swazi Lilangeni', :code => 'SZL', :symbol => 'E', :symbol_position => 'before' },
        { :name => 'Swedish Krona', :code => 'SEK', :symbol => 'kr', :symbol_position => 'before' },
        { :name => 'Swiss Franc', :code => 'CHF', :symbol => 'Fr.', :symbol_position => 'before' },
        { :name => 'Syrian Pound', :code => 'SYP', :symbol => '£S', :symbol_position => 'before' },
        { :name => 'São Tomé and Príncipe Dobra', :code => 'STD', :symbol => 'Db', :symbol_position => 'before' },
        { :name => 'Taiwan New Dollar', :code => 'TWD', :symbol => 'NT$', :symbol_position => 'before' },
        { :name => 'Tajikistani Somoni', :code => 'TJS', :symbol => '', :symbol_position => 'before' },
        { :name => 'Tanzanian Shilling', :code => 'TZS', :symbol => 'TSh', :symbol_position => 'before' },
        { :name => 'Thai Baht', :code => 'THB', :symbol => '฿', :symbol_position => 'before' },
        { :name => 'Tongan Paʻanga', :code => 'TOP', :symbol => 'T$', :symbol_position => 'before' },
        { :name => 'Trinidad and Tobago Dollar', :code => 'TTD', :symbol => 'TT$', :symbol_position => 'before' },
        { :name => 'Tunisian Dinar', :code => 'TND', :symbol => 'د.ت', :symbol_position => 'before' },
        { :name => 'Turkish Lira', :code => 'TRY', :symbol => '₺', :symbol_position => 'before' },
        { :name => 'Turkmenistan New Manat', :code => 'TMT', :symbol => 'T', :symbol_position => 'before' },
        { :name => 'Ugandan Shilling', :code => 'UGX', :symbol => 'USh', :symbol_position => 'before' },
        { :name => 'Ukrainian Hryvnia', :code => 'UAH', :symbol => '₴', :symbol_position => 'before' },
        { :name => 'United Arab Emirates Dirham', :code => 'AED', :symbol => 'د.إ', :symbol_position => 'before' },
        { :name => 'United States Dollar', :code => 'USD', :symbol => '$', :symbol_position => 'before' },
        { :name => 'Uruguayan Peso', :code => 'UYU', :symbol => '$U', :symbol_position => 'before' },
        { :name => 'Uzbekistan Som', :code => 'UZS', :symbol => '', :symbol_position => 'before' },
        { :name => 'Vanuatu Vatu', :code => 'VUV', :symbol => 'VT', :symbol_position => 'before' },
        { :name => 'Venezuelan Bolívar', :code => 'VEF', :symbol => 'Bs.F.', :symbol_position => 'before' },
        { :name => 'Vietnamese Dong', :code => 'VND', :symbol => '₫', :symbol_position => 'before' },
        { :name => 'West African CFA Franc', :code => 'XOF', :symbol => 'CFA', :symbol_position => 'before' },
        { :name => 'Yemeni Rial', :code => 'YER', :symbol => '﷼', :symbol_position => 'before' },
        { :name => 'Yuan Renminbi', :code => 'CNY', :symbol => '¥', :symbol_position => 'before' },
        { :name => 'Zambian Kwacha', :code => 'ZMW', :symbol => 'ZMW', :symbol_position => 'before' },
        { :name => 'Zimbabwe Dollar', :code => 'ZWD', :symbol => 'Z$', :symbol_position => 'before' },
    ].each do |item|
      Spree::Currency.create(item)
    end
  end

  def down
    Spree::Currency.destroy_all
  end
end
