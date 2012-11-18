$(document).ready(function(){
	var container = $('#masonry');
	container.imagesLoaded(function(){
		container.isotope({
		  masonry: {
		  	itemSelector : '.masonry_item',
		    columnWidth: 210
		  }
		});
	});
});