class FotoRistorantesController < ApplicationController
  before_action :set_foto_ristorante, only: %i[ show edit update destroy ]
  before_action :has_ristorante, :only => [:new, :create, :show]

  # GET /foto_ristorantes or /foto_ristorantes.json
  def index
    @foto_ristorantes = FotoRistorante.all
  end

  # GET /foto_ristorantes/1 or /foto_ristorantes/1.json
  def show
  end

  # GET /foto_ristorantes/new
  def new
    @foto_ristorante = FotoRistorante.new
  end

  # GET /foto_ristorantes/1/edit
  def edit
  end

  # POST /foto_ristorantes or /foto_ristorantes.json
  def create
    @foto_ristorante = FotoRistorante.new(foto_ristorante_params)
    @ristorante.foto_ristorante << @foto_ristorante

    respond_to do |format|
      if @foto_ristorante.save
        format.html { redirect_to ristorante_foto_ristorante_path(@ristorante,@foto_ristorante), notice: "Foto ristorante was successfully created." }
        format.json { render :show, status: :created, location: @foto_ristorante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foto_ristorante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foto_ristorantes/1 or /foto_ristorantes/1.json
  def update
    respond_to do |format|
      if @foto_ristorante.update(foto_ristorante_params)
        format.html { redirect_to foto_ristorante_url(@foto_ristorante), notice: "Foto ristorante was successfully updated." }
        format.json { render :show, status: :ok, location: @foto_ristorante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foto_ristorante.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /foto_ristorantes/1 or /foto_ristorantes/1.json
  def destroy
    @foto_ristorante.destroy

    respond_to do |format|
      format.html { redirect_to foto_ristorantes_url, notice: "Foto ristorante was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto_ristorante
      @foto_ristorante = FotoRistorante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foto_ristorante_params
      params.require(:foto_ristorante).permit(:url, :ristorante_id)
    end

  protected
  def has_ristorante
    unless (@ristorante = Ristorante.where(:id => params[:ristorante_id]).first)
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to ristorante_path
    end
  end
end
