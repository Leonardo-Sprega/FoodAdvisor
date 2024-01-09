class RistorantesController < ApplicationController
  before_action :set_ristorante, only: %i[ show edit update destroy ]
  before_action :has_user, :only => [:new, :create, :edit,:update ,:destroy]

  # GET /ristorantes or /ristorantes.json
  def index
    @ristorantes = Ristorante.all
  end

  # GET /ristorantes/1 or /ristorantes/1.json
  def show
    Ristorante.not_geocoded.each { |ristorante| ristorante.geocode && ristorante.save! }
    @risto_coord = Ristorante.where(id: params[:id]).select("latitudine, longitudine, nome").as_json
    gon.latlongrist = @risto_coord
  end

  # GET /ristorantes/new
  def new
    @ristorante = Ristorante.new
    @ristorante.foto_ristorantes.build
    @ristorante.piattos.build
  end

  # GET /ristorantes/1/edit
  def edit
    @ristorante.foto_ristorantes.build
    @ristorante.piattos.build
  end

  # POST /ristorantes or /ristorantes.json
  def create
    @ristorante = Ristorante.new(ristorante_params)
    @ristorante.user_id= current_user.id
    #prende l'id dell' tramite i parametri della sessione
    #o ti fara creare un account prima del ristorante  
    

    respond_to do |format|
      if @ristorante.save
        format.html { redirect_to ristorante_url(@ristorante), notice: "Ristorante was successfully created." }
        format.json { render :show, status: :created, location: @ristorante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ristorante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ristorantes/1 or /ristorantes/1.json
  def update
    respond_to do |format|
      if @ristorante.update(ristorante_params)
        format.html { redirect_to ristorante_url(@ristorante), notice: "Ristorante was successfully updated." }
        format.json { render :show, status: :ok, location: @ristorante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ristorante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ristorantes/1 or /ristorantes/1.json
  def destroy
    @ristorante = Ristorante.find(params[:id])
    @ristorante.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Ristorante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def order_recensione
    order_type = params[:order_type]
    @ristorante = Ristorante.find(params[:id])
    @recensioni = @ristorante.recensiones.order(order_type.to_sym => :desc)
    render partial: 'recensiones/recensione_elenco_recensioni', locals: { recensioni: @recensioni }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ristorante
      @ristorante = Ristorante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ristorante_params
      params.require(:ristorante).permit(:nome, :regione, :provincia, :citta, :indirizzo, :cap, :email, :telefono, :sitoweb1, :sitoweb2, :sitoweb3, :descrizione, :oraapertura, :orachiusura,:latitudine,:longitudine,:user_id ,:tipo_cucina_id, foto_ristorantes_attributes:[ :id, :url, :_destroy], piattos_attributes:[ :id,:nome, :descrizione,:prezzo, :speciale, :_destroy] )
    end

    protected
    def has_user
      #unless @current_user
      #  flash[:warning] = 'You must be logged in to create a ristorante.'
      #  redirect_to ristorantes_path
      #end
    end  
end
