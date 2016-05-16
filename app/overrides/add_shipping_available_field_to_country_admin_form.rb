Deface::Override.new(
    :virtual_path => 'spree/admin/countries/_form',
    :name => 'add_shipping_available_field_to_country_admin_form',
    :insert_bottom => '[data-hook="admin_country_form_fields"]',
    :text => '<div data-hook="shipping_available" class="checkbox">
      <label>
        <%= f.check_box :shipping_available %>
        <%= Spree.t(:shipping_available, scope: :fedex_crossborder) %>
      </label>
    </div>'
)
