class UtentesController < ApplicationController

  before_action :authorized, only: [:show]
  before_action :set_utente, only: %i[ show edit update destroy ]

  # GET /utentes or /utentes.json
  def index
    @utentes = Utente.all
  end

  # GET /utentes/1 or /utentes/1.json
  def show
    @user = Utente.find(params[:id])
  end

  # GET /utentes/new
  def new
    @utente = Utente.new
  end

  # GET /utentes/1/edit
  def edit
  end

  # POST /utentes or /utentes.json
  def create
    
    @user = Utente.find_by(email: utente_params[:email])
    @temp = true

    if utente_params[:nome] == "" || utente_params[:cognome] == "" || utente_params[:username] == "" || utente_params[:telefono] == ""|| utente_params[:cap_regione] == "" || utente_params[:ristoratore] == ""
      @temp = false
    end

    if @user
      flash.alert = "Email già esistente, Riprovare"
      redirect_to new_utente_path

    else 

      if !@temp
        flash.alert  = 'Riempire tutti i campi'
        redirect_to new_utente_path
      
      else
        @utente = Utente.new(utente_params)

        # Parte sessions
        if @utente.save
          session[:user_id] = @utente.id
          redirect_to home_index_path
        else
          render :new
        end
        ################################
      end
    end 
  end

  # PATCH/PUT /utentes/1 or /utentes/1.json
  def update
    respond_to do |format|
      if @utente.update(utente_params)
        format.html { redirect_to utente_url(@utente), notice: "Utente was successfully updated." }
        format.json { render :show, status: :ok, location: @utente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @utente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utentes/1 or /utentes/1.json
  def destroy
    @utente.destroy

    respond_to do |format|
      format.html { redirect_to utentes_url, notice: "Utente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utente
      @utente = Utente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def utente_params
      params.require(:utente).permit(:email, :password)
      params.require(:utente).permit(:username, :nome, :cognome, :cap_regione, :telefono, :email, :password, :ristoratore, :avatar)
    end
end
