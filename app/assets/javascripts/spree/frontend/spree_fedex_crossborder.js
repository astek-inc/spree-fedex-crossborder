// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

(function() {

    Spree.fetch_cart = function() {
        return $.ajax({
            url: Spree.pathFor("cart_link"),
            success: function(data) {
                return $('#link-to-cart').html(data);
            },
            cache: false
        });
    };

}).call(this);
