function toStartPage(id){
    window.location.href="/";
};

function toGymsInTown(id){
    window.location.href="/city=" + id;
};

function returnWithTownId(s) {
  var value = s[s.selectedIndex].id
    location.href = "/city=" + value;
};

function toGymWebsite(url){
    window.open(url,'karl');
};

function townIdSelectGymPage(s) {

  var value = s[s.selectedIndex].id
  var getDivFromGymPage = document.getElementById('gymTitle');
  var selectedGymID = getDivFromGymPage.dataset.gymid;
  location.href = "/gym/" + selectedGymID + "/" + value;
};

$(document).ready(function() {
$("#cover").fadeOut(function() {
    $(this).remove();
    });
});