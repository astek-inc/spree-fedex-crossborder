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


// var DYW = DYW || {};
//
// DYW.currency = {
//
//     default_currency: 'USD',
//
//     getCookieValue: function(a, b) {
//         b = document.cookie.match('(^|;)\\s*' + a + '\\s*=\\s*([^;]+)');
//         return b ? b.pop() : '';
//     },
//
//     doAjaxRequest: function(url, callback) {
//         $.ajax({
//             url: url
//         }).done(function(data) {
//             callback(data);
//         });
//     },
//
//     getCountryData: function(callback) {
//         iso = this.getCookieValue('country');
//         url = 'http://localhost:3000/countries/'+iso+'/find_by_iso';
//         this.doAjaxRequest(url, function(data){
//             callback(data);
//         });
//     },
//
//     getCurrentCurrency: function(callback) {
//         var self = this;
//         this.getCountryData(function(data) {
//             url = 'http://localhost:3000/currencies/' + data.currency_id + '.json';
//             self.doAjaxRequest(url, function(data) {
//                 callback(data);
//             });
//         });
//     },
//
//     convertPrice: function(price, currency) {
//         console.log('Price: '+price);
//         base = $.trim(price).match(/(\d|\.|,)*$/)[0];
//         console.log('Base: '+base);
//         converted = base * currency.exchange_rate.value;
//         console.log('Converted: '+converted);
//         return converted.toFixed(2);
//     }
// };
