class PrenotazionesController < ApplicationController
  before_action :set_prenotazione, only: %i[ show edit update destroy ]
  before_action :has_ristorante_and_user, :only => [:new, :create ]


  # GET /prenotaziones or /prenotaziones.json
  def index
    @prenotaziones = Prenotazione.where(ristorante_id: params[:ristorante_id])
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
    @ut=User.find_by(id: current_user.id)

    @prenotazione.ristorante_id = params[:ristorante_id]
    @prenotazione.user_id= current_user.id
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

  def noutente 
    rist=Ristorante.find_by(id:params[:ristorante_id])
    email=params[:emailcliente]
    ora=params[:ora]
    data=params[:data]
    na=params[:nadulti]
    nb=params[:nbambini]
    if email.present? 
      # Chiamata al mailer solo se l'email è presente e è valida
      PasswordMailer.conf_prenotazione(email, rist, ora, data, na, nb).deliver_now
      redirect_to ristorante_path(rist)
    else
      # Gestione dell'errore se l'email è vuota o non è valida
      flash[:error] = "L'indirizzo email non è valido."
      redirect_to ristorante_path(rist)
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
    #if !user_signed_in?
    #  flash[:warning] = 'Devi accedere con il tuo account'
    #  redirect_to new_user_session_path
    #end
    unless (@ristorante = Ristorante.where(:id => params[:ristorante_id]).first)
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to ristorante_path
    end
  end

end
