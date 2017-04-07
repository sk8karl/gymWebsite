
function indexMap() {
console.log('inne');
var gymsFromList = new Array();
    var rowCount = document.getElementById("indexTable").rows.length;

    for (var i=1; i<rowCount; i++){
        var row = document.getElementById("indexTable").rows[i].cells;
        var gymName = row[1].innerHTML;

        gymsFromList.push(gymName);
    }
        console.log(gymsFromList);


    var getDivFromGymPage = document.getElementById('map');
    var latitude = Number(getDivFromGymPage.dataset.latitude);
    var longitude = Number(getDivFromGymPage.dataset.longitude);
    var town = {lat: latitude, lng: longitude};

/*
    for (i=0; i<gymsFromList.length; i++) {
        getGymLocation(gymsFromList[i], latitude, longitude);
        console.log('gymfromID: ' + gymsFromList[i]);
    }
*/


var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 12,
  center: town
});


// Add some markers to the map.
// Note: The code uses the JavaScript Array.prototype.map() method to
// create an array of markers based on a given "locations" array.
// The map() method here has nothing to do with the Google Maps API.
var markers= [];

infowindow = new google.maps.InfoWindow();
service = new google.maps.places.PlacesService(map);

for (var i = 0; i<gymsFromList.length; i++){
        var request = {

            location: town,
            radius: '5000',
            keyword: gymsFromList[i]
        };

         //console.log('querystring: ' + gymsFromList[i]);

         markers.push(service.nearbySearch(request, callback));


    }
    console.log(markers);


// Add a marker clusterer to manage the markers.
var markerCluster = new MarkerClusterer(map, markers,
    {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
}

function callback(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {

        for (var i = 0; i < results.length; i++) {

        createMarker(results[i]);

        }
    }
}

function createMarker(place) {
    var markers = [];
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location

});
    markers.push(marker);

    google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
});
}


