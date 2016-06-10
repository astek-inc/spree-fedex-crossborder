Deface::Override.new(
    :virtual_path => 'spree/checkout/edit',
    :name => 'replace_checkout_form_wrapper',
    :replace_contents => '[data-hook="checkout_form_wrapper"]',
    :text => '<% if @order.state == \'delivery\' && current_country != Rails.configuration.default_country_iso %>
      <%= render "spree/checkout/delivery/international" %>
    <% else %>
      <%= form_for @order, url: update_checkout_path(@order.state), html: { id: "checkout_form_#{@order.state}" } do |form| %>
        <% if @order.state == "address" || !@order.email? %>
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="form-group">
                <%= form.label :email %>
                <%= form.text_field :email, class: "form-control" %>
              </div>
            </div>
          </div>
        <% end %>
        <%= form.hidden_field :state_lock_version %>
        <%= render @order.state, form: form %>
      <% end %>
    <% end %>'
)
