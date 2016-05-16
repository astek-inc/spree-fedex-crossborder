Deface::Override.new(
    :original => '7a86de766e72e8dbfecb90830168ed20c9bbf3d9',
    :virtual_path => 'spree/admin/shared/sub_menu/_configuration',
    :name => 'add_currencies_to_admin_configuration_sidebar',
    insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
    :text => '<%= configurations_sidebar_menu_item Spree.t(:currencies, scope: :fedex_crossborder), spree.admin_currencies_path %>'
)

