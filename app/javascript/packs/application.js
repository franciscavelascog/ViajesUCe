// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");


import "bootstrap";

var jQuery = require("jquery");

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

var formatThousandsNoRounding = function(n, dp){
    var e = '', s = e+n, l = s.length, b = n < 0 ? 1 : 0,
        i = s.lastIndexOf(','), j = i == -1 ? l : i,
        r = e, d = s.substr(j+1, dp);
    while ( (j-=3) > b ) { r = '.' + s.substr(j, 3) + r; }
    return s.substr(0, j + 3) + r + 
      (dp ? ',' + d + ( d.length < dp ? 
          ('00000').substr(0, dp - d.length):e):e);
  };
  
  var hasRun = false;
  
  inView('#countUp').on('enter', function() {
      if (hasRun == false) {
          $('.number').each(function() {
              var $this = $(this),
                  countTo = $this.attr('data-count');
  
              $({ countNum: $this.text()}).animate({
                  countNum: countTo
              },
              {
                  duration: 2000,
                  easing:'linear',
                  step: function() {
                      $this.text(formatThousandsNoRounding(Math.floor(this.countNum)));
                  },
                  complete: function() {
                      $this.text(formatThousandsNoRounding(this.countNum));
                  }
              });
          });
          hasRun = true;
      }
  });

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
