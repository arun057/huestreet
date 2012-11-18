$(document).ready(function(){
	navigator.geolocation.getCurrentPosition(GetLocation);
	function GetLocation(location) {
		$('#asset_lat').val(location.coords.latitude);
		$('#asset_lng').val(location.coords.longitude);
	}

	$('#new_asset').bind('submit', function(e){
		if(!$('#image_uploader').val().length){
			e.preventDefault();
			return false;
		}
		$(this).find('input[type="submit"]').attr('disabled', 'disabled').attr('value', 'Uploading...');
	});
});