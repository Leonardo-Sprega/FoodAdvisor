import "leaflet"


document.addEventListener("turbo:load", ()=>{

    let coord1 = gon.latlongrist
    var map = L.map('map', {
        attributionControl: false,
        zoomControl: true
    }).setView([parseFloat(JSON.stringify(coord1[0]["latitudine"])),parseFloat(JSON.stringify(coord1[0]["longitudine"]))], 14);
    
    
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
    }).addTo(map);



    L.marker([parseFloat(JSON.stringify(coord1[0]["latitudine"])),parseFloat(JSON.stringify(coord1[0]["longitudine"]))])
    .bindPopup("<p>"+coord1[0]["nome"]+"</p>")
    .addTo(map);


    console.log(JSON.stringify(coord1));

    map.zoomControl.setPosition('bottomright');
  })

