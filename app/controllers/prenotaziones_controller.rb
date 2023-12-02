class PrenotazionesController < ApplicationController
  before_action :set_prenotazione, only: %i[ show edit update destroy ]
  before_action :has_ristorante_and_user, :only => [:new, :create ]


  # GET /prenotaziones or /prenotaziones.json
  def index
    @prenotaziones = Prenotazione.all
  end

  # GET /prenotaziones/1 or /prenotaziones/1.json
  def show
  end

  # GET /prenotaziones/new
  def new
    @prenotazione = Prenotazione.new
  end

  # GET /prenotaziones/1/edit
  def edit
  end

  # POST /prenotaziones or /prenotaziones.json
  def create
    @prenotazione = Prenotazione.new(prenotazione_params)
    
    @rist=Ristorante.find_by(id:params[:ristorante_id])
    @ut=User.find_by(id: session[:user_id])

    @prenotazione.ristorante_id = params[:ristorante_id]
    @prenotazione.user_id= session[:user_id]
    #@current_user.prenotazione << @prenotazione
    @ut.prenotaziones << @prenotazione
    @rist.prenotaziones << @prenotazione

    respond_to do |format|
      if @prenotazione.save
        format.html { redirect_to ristorante_prenotazione_path(@ristorante,@prenotazione), notice: "Prenotazione was successfully created." }
        format.json { render :show, status: :created, location: @prenotazione }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prenotazione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prenotaziones/1 or /prenotaziones/1.json
  def update
    respond_to do |format|
      if @prenotazione.update(prenotazione_params)
        format.html { redirect_to prenotazione_url(@prenotazione), notice: "Prenotazione was successfully updated." }
        format.json { render :show, status: :ok, location: @prenotazione }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prenotazione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prenotaziones/1 or /prenotaziones/1.json
  def destroy
    @prenotazione.destroy

    respond_to do |format|
      format.html { redirect_to prenotaziones_url, notice: "Prenotazione was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prenotazione
      @prenotazione = Prenotazione.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prenotazione_params
      params.require(:prenotazione).permit(:ora, :data, :nomecliente, :cognomecliente, :telefonocliente, :emailcliente, :nadulti, :nbambini, :messaggio, :user_id, :ristorante_id)
    end

  protected
  def has_ristorante_and_user
    unless Current.user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to ristorante_path
    end
    unless (@ristorante = Ristorante.where(:id => params[:ristorante_id]).first)
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to ristorante_path
    end
  end

end
