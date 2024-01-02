class HomeController < ApplicationController
  def index
    @ristorantes = Ristorante.all
    @type = TipoCucina.all
    @coords = Ristorante.select("latitudine, longitudine, nome, indirizzo, citta, id").as_json
    gon.coordinate = @coords
  end
end
