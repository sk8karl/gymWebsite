
var map;
var infowindow;

// All gyms in sweden


function swedenMap(){

    var gymsFromList = new Array();
    var sweCords = {lat: 58.5740461, lng: 15.1078977};
    var uppsalaCords = {lat: 59.8601083, lng: 17.6433355};
    var sthlmCords = {lat: 59.3274242, lng: 18.071996};
    var malmoCords = {lat: 55.5986063, lng: 13.0019066};
    var gbgCords = {lat: 57.7003634, lng: 11.9925318};


    var townCords = [
        uppsalaCords,
        sthlmCords,
        malmoCords,
        gbgCords,
    ]

    var rowCount = document.getElementById("indexTable").rows.length;

    for (var i=1; i<rowCount; i++){
        var row = document.getElementById("indexTable").rows[i].cells;
        var gymName = row[1].innerHTML;
        gymsFromList.push(gymName);
    }

    console.log(gymsFromList);

    getGymLocationSweden(gymsFromList, sweCords, townCords);
}


function getGymLocationSweden(gymsFromList, sweCords, townCords) {


   // var townCords = {lat: townLatitude, lng: townLongitude};
    var allRequests = new Array();

    map = new google.maps.Map(document.getElementById('map'), {
      center: sweCords,
      zoom: 5
    });
    //console.log(gymsFromList.length);
    infowindow = new google.maps.InfoWindow();
    for (var i = 0; i<gymsFromList.length; i++){
        for (var k=0; k<4; k++){

        var request = {

            location: townCords[k],
            radius: '5000',
            query: gymsFromList[i]
         };

        service = new google.maps.places.PlacesService(map);
        service.textSearch(request, callback);
         allRequests.push(request);
        }
    }
    //console.log(allRequests);
    //console.log(allRequests[0][0]);

}

function callback(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {

                createMarker(results[i]);
          }
    }
}

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location

});


google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
});
}


// -----------------------------------------------------------


// Display all gyms for a specific town

function indexMap(){

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

    getGymLocation(gymsFromList, latitude, longitude);

}

function getGymLocation(gymsFromList, latitude, longitude) {

    var town = {lat: latitude, lng: longitude};
    var allRequests = new Array();

    map = new google.maps.Map(document.getElementById('map'), {
      center: town,
      zoom: 12
    });

    infowindow = new google.maps.InfoWindow();
    service = new google.maps.places.PlacesService(map);
    var hej = 1;

    for (var i = 0; i<gymsFromList.length; i++){
        var request = {

            location: town,
            radius: '5000',
            keyword: gymsFromList[i]
        };

         //console.log('querystring: ' + gymsFromList[i]);

         service.nearbySearch(request, callback);

        console.log('hej: ' + hej);
        hej++;
         //allRequests.push(request);
    }
    //console.log(allRequests);
}


function callback(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {

        for (var i = 0; i < results.length; i++) {

        createMarker(results[i]);

        }
    }
}

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location

});

google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
});
}


//google.maps.event.addDomListener(window, 'load', indexMap);

// -----------------------------------------------------------




//Create map for a specific gym in a specific town in gymPage.html view

function initMap(){
    var getDivFromGymPage = document.getElementById('map');
    var queryString = getDivFromGymPage.dataset.searchString;

    var latitude = Number(getDivFromGymPage.dataset.latitude);
    var longitude = Number(getDivFromGymPage.dataset.longitude);

    initialize(queryString, latitude, longitude);

}

function initialize(queryString, latitude, longitude) {
    var townCords = {lat: latitude, lng: longitude};

    map = new google.maps.Map(document.getElementById('map'), {
      center: townCords,
      zoom: 11
    });

    infowindow = new google.maps.InfoWindow();

    var request = {

        location: townCords,
        radius: '3000',
        query: queryString
      };

      //console.log('townCords: ' + townCords);
      //console.log('querystring: ' + queryString);


    //console.log(request);

      service = new google.maps.places.PlacesService(map);
      service.textSearch(request, callback);
}


function callback(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
    //    console.log(results[0].name);
      for (var i = 0; i < results.length; i++) {

            createMarker(results[i]);
      }
    }
}

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location

});

google.maps.event.addListener(marker, 'mouseover', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
});
}


