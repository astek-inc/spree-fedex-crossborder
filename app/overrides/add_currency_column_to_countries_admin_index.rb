Deface::Override.new(
    :original => 'bdef8b34fd0cba967cd73dbbc3f0d820cd7b73f6',
    :virtual_path => 'spree/admin/countries/index',
    :name => 'add_currency_header_to_countries_admin_index',
    :insert_before => 'tr[data-hook="tax_header"] th:last-child',
    :text => '<th><%= Spree.t(:currency, scope: :fedex_crossborder) %></th>'
)

Deface::Override.new(
    :original => '7a17e2d58a09927ab4903b6109fb53e52fd3c5d8',
    :virtual_path => 'spree/admin/countries/index',
    :name => 'add_currency_cells_to_countries_admin_index',
    :insert_before => 'tr[data-hook="country_row"] td:last-child',
    :text => '<td class="currency"><%= (country.currency ? country.currency.code : \'\') %></td>'
)
