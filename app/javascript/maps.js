import "leaflet"


document.addEventListener("turbo:load", ()=>{
    var map = L.map('map', {
        attributionControl: false,
        zoomControl: true
    }).setView([42.420, 12.64], 5);
    
    
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
    }).addTo(map);

    var marker = L.marker([17.385044, 78.486671]);

    marker.addTo(map);

    map.zoomControl.setPosition('bottomright');
  })