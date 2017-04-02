function swedenMap() {
    var options = {
        'zoom': 5,
        'center': {lat: 58.5740461, lng: 15.1078977},
    };
    var map = new google.maps.Map(document.getElementById('map'), options);
    var mcOptions={gridSize: 10};

    // Create an array of alphabetical characters used to label the markers.
    var labels = 'ABCDEF';

    // Add some markers to the map.
    // Note: The code uses the JavaScript Array.prototype.map() method to
    // create an array of markers based on a given "locations" array.
    // The map() method here has nothing to do with the Google Maps API.
    var markers = locations.map(function(location, i) {
        return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length]
        });
    });

    // Add a marker clusterer to manage the markers.

    var markerCluster = new MarkerClusterer(map, markers,
        {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'}, mcOptions);
  }
  var locations = [
    {lat: 59.8616597, lng: 17.6344078},
    {lat: 59.8616597, lng: 17.6244078},
    {lat: 59.8616597, lng: 17.6144078},
    {lat: 59.3253866, lng: 18.071022},
    {lat: 59.3253866, lng: 18.021022},
    {lat: 59.8616597, lng: 17.6344078},
    {lat: 59.8616597, lng: 17.6244078},
    {lat: 59.8616597, lng: 17.6144078},
    {lat: 59.3253866, lng: 18.071022},
    {lat: 59.3253866, lng: 18.021022},
    {lat: 59.8616597, lng: 17.6344078},
    {lat: 59.8616597, lng: 17.6244078},
    {lat: 59.8616597, lng: 17.6144078},
    {lat: 59.3253866, lng: 18.071022},
    {lat: 59.3253866, lng: 18.021022},
    {lat: 59.8616597, lng: 17.6344078},
    {lat: 59.8616597, lng: 17.6244078},
    {lat: 59.8616597, lng: 17.6144078},
    {lat: 59.3253866, lng: 18.071022},
    {lat: 59.3253866, lng: 18.021022},
    {lat: 57.6917401, lng: 12.007638},
    {lat: 57.6917401, lng: 12.607638},
    {lat: 57.6917401, lng: 12.407638},
    {lat: 57.6917401, lng: 12.107638},
    {lat: 57.4917401, lng: 12.007638},
    {lat: 57.3917401, lng: 12.007638},

  ]

