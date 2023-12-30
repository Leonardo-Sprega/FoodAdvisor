class HomeController < ApplicationController
  def index
    @ristorantes = Ristorante.all
    @type = TipoCucina.all
  end
end
