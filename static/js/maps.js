// JS script relating to map interaction lives here. 

L.mapbox.accessToken = 'pk.eyJ1IjoiZ2xhc3NlczRkYXlzIiwiYSI6ImNpbzBpa3VnODFhNmd1a20zamx3M21xNjMifQ.YAac-e2qviFlZOykJE4riQ';
var map = L.mapbox.map('map', 'mapbox.streets').setView([37.799648, -122.354083], 12, {
    accessToken: 'pk.eyJ1IjoiZ2xhc3NlczRkYXlzIiwiYSI6ImNpbzBpa3VnODFhNmd1a20zamx3M21xNjMifQ.YAac-e2qviFlZOykJE4riQ'
});


$(document).ready(function() {
    var markers;
    // This grabs the html template from script tage in homepage.html
    var commentFormTemplate = $('#comment-form').html();

    // Declaring this here because need to call it inside filter click handler
    var bindPopupToMarker = function(layer) {
        console.log('bindPopupToMarker renders Mustache template for markers');
        // here you call `bindPopup` with a string of HTML you create - the feature
        // properties declared above are available under `layer.feature.properties` 
        var popupTemplate = $('#popup-template').html();
        var content = Mustache.render(popupTemplate, { parkName: layer.feature.properties.title, parkId: layer.feature.properties.park_id });
        layer.bindPopup(content);
        };

    var geojson = $.get('/create_map_features.json', function (data) {
        var features = data.features;
        markers = L.mapbox.featureLayer(features).addTo(map);
    });

    //.then accesses the geojson promise and then I can access the markers
    // in order to add a link to the html.
    geojson.then(function(data){
        L.mapbox.accessToken = 'pk.eyJ1IjoiZ2xhc3NlczRkYXlzIiwiYSI6ImNpbzBpa3VnODFhNmd1a20zamx3M21xNjMifQ.YAac-e2qviFlZOykJE4riQ';
        console.log('geojson.then marker bindPopup');
        // This comes directly from mapbox api custom-popup
        markers.eachLayer(bindPopupToMarker);
        markers.on('click', function(marker) {
            $.get('/park_info/' + marker.layer.feature.properties.park_id).then(function(content) {
                L.mapbox.accessToken = 'pk.eyJ1IjoiZ2xhc3NlczRkYXlzIiwiYSI6ImNpbzBpa3VnODFhNmd1a20zamx3M21xNjMifQ.YAac-e2qviFlZOykJE4riQ';
                var onlyWhatWeWant = $(content);
                $('#park-info').html(onlyWhatWeWant);
            });
        });
    }, function(reason) {console.log("I failed");});

    // Adds the geolocation button and function
    L.control.locate({keepCurrentZoomLevel: true}).addTo(map);

    $('.park-types').on('click', function() {
        L.mapbox.accessToken = 'pk.eyJ1IjoiZ2xhc3NlczRkYXlzIiwiYSI6ImNpbzBpa3VnODFhNmd1a20zamx3M21xNjMifQ.YAac-e2qviFlZOykJE4riQ';
        console.log('on click filter');
        // For each filter link, get the 'data-filter' attribute value.
        var filter = $(this).data('filter');
        
        // Initialize empty array for park info.
        var parkTitles = [];
        //Adds the class active and removes it from siblings
        $(this).addClass('active').siblings().removeClass('active');
        markers.setFilter(function(f) {
            // If the data-filter attribute is set to "all", return
            // all (true). Otherwise, filter on markers that have
            // a value set to true based on the filter name.
            if (filter === 'all') {
                return true;
            } else {
                if (f.properties[filter] === true) {
                    // Look through all parks and see if filter is true
                    // If it is, push it to the list. 
                    parkTitles.push(f.properties['title']);
                    return true;
                } else {
                    return false;
                }
            }
        });

        // call bindPopuptoMarker because .setFilter is destroying popup cotent
        // markers.eachLayer(bindPopupToMarker);
        var parkHtml = "<ul>";
        parkTitles.forEach(function(park) {
            parkItem = "<li>" + park.toUpperCase() + "</li>";
            parkHtml += parkItem;
        });

        parkHtml += "</ul>";
        $('#park-titles').html(parkHtml);
        return false;
    });

});