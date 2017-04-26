
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
