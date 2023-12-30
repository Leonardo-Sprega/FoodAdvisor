class PagesController < ApplicationController
    def home
    end
  
    def about
    end
  
    def contact
    end
  
    def help
    end
  
    def terms_of_service
    end

    def filters
      @ristoranti = Ristorante.page(params[:page]).per(1)
      #@ristoranti_filter = @ristoranti.joins(:tipo_cucinas).where(["tipo_cucinas.id = ? and tipo_cucinas.nome = ?", "@ristoranti.id"])
      if params.has_key?(:type)
        @cucina = 'I migliori nella categoria '+params[:type].capitalize()
      else
        @cucina = 'I ristoranti migliori'
        @dislay = @ristoranti
      end

    end


  end