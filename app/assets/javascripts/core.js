$(function() {
	console.log('this is just a test');
	
	setInitialMenu(); // aim to get rid of this line
	$('#menu').menu();
	//$('#carousel').carousel(); // write the carousel plug-in
});

// Try to factor this into a plugin called menu so that you can uncomment the line above
function setInitialMenu() {
	var section = $('body').data('section');
	var menuItem = $("a[data-section='" + section + "']");
	menuItem.css('highlighted');  // define this style (just use a colour change for now)
}

(function($) 
{
  var defaults = {};
  $.fn.menu = function(options) 
  {        
    var opts = $.extend({}, defaults, options);
    return this.each(function() 
    {
      if (this.menu) { return false; }
      var self = 
      {   
        initialize: function()
        {
  				console.log('hello from plugin');
        }
      };
      this.menu = self;
      self.initialize();      
    });
  };
})(jQuery);

// Carousel plug-in requirements
// 1. hide all but the first child panel (all child panels have class carouselItem)