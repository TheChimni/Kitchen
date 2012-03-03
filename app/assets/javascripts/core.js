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
    return this.each(function() {
			var $this = $(this);
      if (this.carousel) { return false; }
      var self = {
        initialize: function() {
					this.currentPanel = $('.carouselItem:first', $this).show();
					$("<a class='carouselButton left'>&lt;</a>").appendTo($this).click(function(){
						self.showPrevious();
					});
					$("<a class='carouselButton right'>&gt;</a>").appendTo($this).click(function(){
						self.showNext();
					});
			  },
				showPrevious: function() {
					this.setCurrent(this.currentPanel.prev('.carouselItem'));
				},
				showNext: function() {
					this.setCurrent(this.currentPanel.next('.carouselItem'));
				},
				setCurrent: function(newCurrent) {
					if (newCurrent.length > 0) {
						this.currentPanel.hide();
						this.currentPanel = newCurrent;
						this.currentPanel.show();
					}
				}
      };
      this.carousel = self;
      self.initialize();      
    });
	};

})(jQuery);


// Carousel plug-in requirements
// 1. hide all but the first child panel (all child panels have class carouselItem)