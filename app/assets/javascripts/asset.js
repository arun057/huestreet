$(document).ready(function(){
	navigator.geolocation.getCurrentPosition(GetLocation);
	function GetLocation(location) {
		$('#asset_lat').val(location.coords.latitude);
		$('#asset_lng').val(location.coords.longitude);
	}

	$('#new_asset').bind('submit', function(){
		$(this).find('input[type="submit"]').attr('disabled', 'disabled').attr('value', 'Uploading...');
	});
});