Deface::Override.new(
    :virtual_path => 'spree/admin/countries/_form',
    :name => 'add_currency_field_to_country_admin_form',
    :insert_after => '[data-hook="iso_name"]',
    :text => "<%= f.field_container :iso_name, class: ['form-group'], 'data-hook' => 'currency' do %>
            <%= f.label :currency, Spree.t(:currency, scope: :fedex_crossborder) %> <span class=\"required\">*</span>
            <%= f.select :currency_id, @currencies.collect { |s| [s.name, s.id] }, {}, { :required => true, :class => 'form-control' } %>
            <%= f.error_message_on :iso_name %>
      <% end %>
    </div>"
)
