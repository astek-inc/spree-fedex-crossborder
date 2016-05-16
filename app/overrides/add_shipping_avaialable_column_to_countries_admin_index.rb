Deface::Override.new(
    :virtual_path => 'spree/admin/countries/index',
    :name => 'add_shipping_available_header_to_countries_admin_index',
    :insert_before => 'tr[data-hook="tax_header"] th:last-child',
    :text => '<th><%= Spree.t(:shipping_available, scope: :fedex_crossborder) %></th>'
)

Deface::Override.new(
    :virtual_path => 'spree/admin/countries/index',
    :name => 'add_shipping_available_cells_to_countries_admin_index',
    :insert_before => 'tr[data-hook="country_row"] td:last-child',
    :text => '<td class="shipping_available"><%= country.shipping_available? ? Spree.t(:say_yes) : Spree.t(:say_no) %></td>'
)
