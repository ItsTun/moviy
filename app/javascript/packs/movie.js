(function() {
  var MovieModule;

  window.easymoviy = window.easymoviy || {};

  MovieModule = {};
  MovieModule.Carousel = {
  	autoInit: function(){
      return ($("body").hasClass('carousel slide'))
  	},
    init: function(){
      
    }
  };

  $.extend(window.easymoviy, MovieModule);

}).call(this);