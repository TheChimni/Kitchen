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
      // this represents the carousel DOM object, i.e. the div with id '#carousel' in our case
      // $this is just a jQuery wrapper around this (just a naming convention)
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
					if (this.currentPanel.prev('.carouselItem').length > 0) {
						this.setCurrent(this.currentPanel.prev('.carouselItem'), 'left');
					} else {
						this.setCurrent($('.carouselItem:last', $this), 'left');
					}
				},
				showNext: function() {
					if (this.currentPanel.next('.carouselItem').length > 0) {
						this.setCurrent(this.currentPanel.next('.carouselItem'), 'right');
					} else {
						this.setCurrent($('.carouselItem:first', $this), 'right');
					}	
				},
				setCurrent: function(newCurrent, direction) {
						var oldPanel = this.currentPanel;
            this.currentPanel = newCurrent;
						if (direction == 'left') {
							this.currentPanel.css({ left: '960px' });
						} else {
							this.currentPanel.css({ left: '-960px' });
						}

						// here 'this' is the object that we have assigned to the 'self' vairable above
            this.currentPanel.show();

						this.currentPanel.animate({
              left: '0px'
						}, 500, function() {
						});

						if (direction == 'left') {
							oldPanel.animate({
	              left: '-960px'
							}, 500, function() {
	              // in this callback 'this' would be the currentPanel DOM object
	              oldPanel.hide();
	              oldPanel.css({ left: '0px' });
							});
						} else {
							oldPanel.animate({left: '960px'}, 500, function() {
								// reseting the position and visibility of the carousel item back to it's initial state
								oldPanel.hide();
								oldPanel.css({ left: '0px' })
							  // stuff to do after animation is complete
							})
						}
				},
				animateOldPanel: function(direction) {
					
				}
      };
      this.carousel = self;
      self.initialize();      
    });
	};

})(jQuery);


// Carousel plug-in requirements
// 1. hide all but the first child panel (all child panels have class carouselItem)
