class ProfiloController < ApplicationController

    def index
      if !user_signed_in? 
        redirect_to home_index_path
      end
    end

    def dati_utente
      respond_to do |format|
        format.js
      end
    end

    def ristoranti_utente
      if current_user.ristoratore.downcase == 'true' || current_user.ristoratore.downcase == 'si'
        @ristoranti = Ristorante.where(user_id: current_user).page(params[:page]).per(5)
      else
        @ristoranti = Ristorante.joins(:likes).where(likes: {user_id: current_user}).page(params[:page]).per(5)
      end
      respond_to do |format|
        format.js
      end
    end

    def prenotazioni_utente
      if current_user.ristoratore.downcase == 'true' || current_user.ristoratore.downcase == 'si'
        @ristoranti = Ristorante.joins(:prenotaziones).where(user_id: current_user).page(params[:page]).per(5)
      else
        @ristoranti = Ristorante.joins(:prenotaziones).where(prenotaziones: {user_id: current_user}).page(params[:page]).per(5)
      end
      respond_to do |format|
        format.js
      end
    end

    
    def recensioni_utente
      if current_user.ristoratore.downcase == 'true' || current_user.ristoratore.downcase == 'si'
        @ristoranti = Ristorante.joins(:recensiones).where(user_id: current_user).page(params[:page]).per(5)
      else
        @ristoranti = Ristorante.joins(:recensiones).where(recensiones: {user_id: current_user}).page(params[:page]).per(5)
        @recensioni = Recensione.where(user_id: current_user)
      end
      respond_to do |format|
        format.js
      end
    end

  end