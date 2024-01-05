class HomeController < ApplicationController
  def index
    @ristorantes = Ristorante.all
    @type = TipoCucina.all
    @coords = Ristorante.select("latitudine, longitudine, nome, indirizzo, citta, id").as_json
    gon.coordinate = @coords

    @result = Geocoder.search(request.location).first.coordinates
    @vicino = Ristorante.near(@result, 15, units: :km)
  end
end
