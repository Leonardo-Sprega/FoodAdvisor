class PagesController < ApplicationController
  
    def about
    end
  
    def contact
    end
  
    def help
    end
  
    def terms_of_service
    end

    def filters
      @categorie = TipoCucina.all
      if params.has_key?(:type)
        @cucina = 'I migliori nella categoria '+params[:type].capitalize()
        @ristoranti = Ristorante.joins(:tipo_cucina).where(tipo_cucinas: {nome: params[:type]}).page(params[:page]).per(5)
      else
        @cucina = 'I migliori ristoranti'
        @ristoranti = Ristorante.page(params[:page]).per(5)
      end

    end


  end