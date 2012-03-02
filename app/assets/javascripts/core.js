$(function() {
	$('#menu').menu();
	$('#carousel').carousel();
});

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
					var section = $('body').data('section');
					var menuItem = $("a[data-section='" + section + "']");
					menuItem.css({'background-color': 'rgb(244,244,244)'});  // define this style (just use a colour change for now)
        }
      };
      this.menu = self;
      self.initialize();      
    });
  };

	$.fn.carousel = function(options){
		var opts = $.extend({}, defaults, options);
    return this.each(function() 
    {
			$this = $(this);
      if (this.carousel) { return false; }
      var self = 
      {   
        initialize: function()
        {
					$('.carouselItem:first', $this).show();
					$("<a class='carouselButton left'>&lt;</a>").appendTo($this);
					$("<a class='carouselButton right'>&gt;</a>").appendTo($this);
			  }
      };
      this.carousel = self;
      self.initialize();      
    });
	};

})(jQuery);


// Carousel plug-in requirements
// 1. hide all but the first child panel (all child panels have class carouselItem)