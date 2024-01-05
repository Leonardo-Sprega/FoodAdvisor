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

      @q = Ristorante.ransack(params[:q])
      @ristoranti = @q.result(distinct: true).includes(:tipo_cucina).page(params[:page]).per(5)


    end


  end