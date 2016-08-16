Deface::Override.new(
    :original => 'b65e4d5a9e1413dbeeb28f090ae784235f518d4e',
    :virtual_path => 'spree/admin/shared/sub_menu/_configuration',
    :name => 'add_fedex_crossborder_distribution_centers_to_admin_config_sidebar',
    insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
    :text => '<%= configurations_sidebar_menu_item Spree.t(:fedex_crossborder, scope: :fedex_crossborder) + " " + Spree.t(:distribution_centers, scope: :fedex_crossborder), spree.admin_fedex_crossborder_distribution_centers_path %>'
)

