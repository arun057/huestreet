$(document).ready(function(){
	navigator.geolocation.getCurrentPosition(GetLocation);
	function GetLocation(location) {
		$('#asset_lat').val(location.coords.latitude);
		$('#asset_lng').val(location.coords.longitude);
	}
});