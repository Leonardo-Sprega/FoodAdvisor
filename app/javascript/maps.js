import "leaflet"


document.addEventListener("turbo:load", ()=>{
    var map = L.map('map', {
        attributionControl: false,
        zoomControl: true
    }).setView([42.420, 12.64], 5);
    
    
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
    }).addTo(map);


    let coord = gon.coordinate;
    var FGMarker = new L.FeatureGroup() ;

    for(let i = 0; i<coord.length; i++){
        if (i != 4){
            var marker = L.marker([parseFloat(JSON.stringify(coord[i]["latitudine"])),parseFloat(JSON.stringify(coord[i]["longitudine"]))])
            .bindPopup("<p><h6>"+'<a href="http://localhost:3000/ristorantes/'+coord[i]["id"]+'">'+coord[i]["nome"]+'</a>'+"</h6>"+coord[i]["indirizzo"]+", "+coord[i]["citta"]+"</p>")
            .on('click', function(e){
                map.flyTo(e.latlng, 13);
            })
            .on({
                popupclose: (e) => {
                    map.fitBounds(FGMarker.getBounds());
                }
            });
            FGMarker.addLayer(marker);
            FGMarker.addTo(map);
            
        }
    }

    map.fitBounds(FGMarker.getBounds());

    map.zoomControl.setPosition('bottomright');
  })

