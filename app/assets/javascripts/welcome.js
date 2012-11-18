$(document).bind('ready', function(){
	var color_button = $('#color_tile');
	if(color_button.length){
		//do stuff here.
		var color_dropdown = color_button.siblings('.sub-menu');
		color_button.bind('click', function(){
			if(color_dropdown.hasClass('active')){
				color_dropdown.stop().animate({'opacity' : 0}, 300, function(){
					color_dropdown.hide();
				});
				color_dropdown.removeClass('active');
			}else{
				color_dropdown.stop().show().animate({'opacity' : 1}, 300);
				color_dropdown.addClass('active');
			}
		});

		$('li', color_dropdown).bind('click', function(){
			color_button.css('background-color', $(this).attr('background-color'));
			window.location = $(this).find('a').attr('href');
		});
	}
});