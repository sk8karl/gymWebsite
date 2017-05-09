

function cityClicked(s) {
    var townid = s[s.selectedIndex].id
    location.href = "/city=" + townid;
};
/*
$(document).ready(function() {
$("#cover").fadeOut(function() {
    $(this).remove(); // Optional if it's going to only be used once.
    });
});
*/

// Search bar functionality

$(document).ready(function() {
    var e = document.getElementById("town-list");
    var towns = [];

   // var towns = [];
    for (var i = 1; i < e.length; i++) {
            var town_name = e.options[i].text;
            var town_id = e.options[i].id;

            var name_id = {
                label: town_name,
                id: town_id
            };

            towns.push(name_id);
    }

    $('#indexSearch').autocomplete({
        source: towns,
        select: function (event, ui) {
            location.href='/city=' + ui.item.id;
        }
    });
});
