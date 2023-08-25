class HomeController < ApplicationController
  def index
    @ristorantes = Ristorante.all 
    @foto_ristorantes = FotoRistorante.all
  end
end
