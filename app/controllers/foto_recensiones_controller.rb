class FotoRecensionesController < ApplicationController
  before_action :set_foto_recensione, only: %i[ show edit update destroy ]
  before_action :has_recensione, :only => [:new, :create, :show]

  # GET /foto_recensiones or /foto_recensiones.json
  def index
    @foto_recensiones = FotoRecensione.all
  end
  # GET /foto_recensiones/1 or /foto_recensiones/1.json
  def show
  end
  
  # GET /foto_recensiones/new
  def new
    @foto_recensione = FotoRecensione.new
  end

  # GET /foto_recensiones/1/edit
  def edit
  end

  # POST /foto_recensiones or /foto_recensiones.json
  def create
    @foto_recensione = FotoRecensione.new(foto_recensione_params)
    @recensione.foto_recensione << @foto_recensione

    respond_to do |format|
      if @foto_recensione.save
        format.html { redirect_to ristorante_recensione_foto_recensione_path(@ristorante,@recensione,@foto_recensione), notice: "Foto recensione was successfully created." }
        format.json { render :show, status: :created, location: @foto_recensione }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foto_recensione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foto_recensiones/1 or /foto_recensiones/1.json
  def update
    respond_to do |format|
      if @foto_recensione.update(foto_recensione_params)
        format.html { redirect_to foto_recensione_url(@foto_recensione), notice: "Foto recensione was successfully updated." }
        format.json { render :show, status: :ok, location: @foto_recensione }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foto_recensione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foto_recensiones/1 or /foto_recensiones/1.json
  def destroy
    @foto_recensione.destroy

    respond_to do |format|
      format.html { redirect_to foto_recensiones_url, notice: "Foto recensione was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto_recensione
      @foto_recensione = FotoRecensione.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foto_recensione_params
      params.require(:foto_recensione).permit(:url, :recensione_id)
    end

  protected
  def has_recensione
    unless (@recensione = Recensione.where(:id => params[:recensione_id]).first)
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to ristorante_path
    end
  end
end
