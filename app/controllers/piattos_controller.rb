class PiattosController < ApplicationController
  before_action :set_piatto, only: %i[ show edit update destroy ]
  before_action :has_ristorante

  # GET /piattos or /piattos.json
  def index
    @piattos = Piatto.all
  end

  # GET /piattos/1 or /piattos/1.json
  def show
  end

  # GET /piattos/new
  def new
    @piatto = Piatto.new
  end

  # GET /piattos/1/edit
  def edit
  end

  # POST /piattos or /piattos.json
  def create
    @piatto = Piatto.new(piatto_params)
    @ristorante.piatto << @piatto

    respond_to do |format|
      if @piatto.save
        format.html { redirect_to piatto_url(@piatto), notice: "Piatto was successfully created." }
        format.json { render :show, status: :created, location: @piatto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @piatto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /piattos/1 or /piattos/1.json
  def update
    respond_to do |format|
      if @piatto.update(piatto_params)
        format.html { redirect_to piatto_url(@piatto), notice: "Piatto was successfully updated." }
        format.json { render :show, status: :ok, location: @piatto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @piatto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piattos/1 or /piattos/1.json
  def destroy
    @piatto.destroy

    respond_to do |format|
      format.html { redirect_to piattos_url, notice: "Piatto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piatto
      @piatto = Piatto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def piatto_params
      params.require(:piatto).permit(:nome, :descrizione,:prezzo,:ristorante_id)
    end

    protected
  def has_ristorante
    unless (@ristorante = Ristorante.where(:id => params[:ristorante_id]).first)
      flash[:warning] = 'Piatto must be for an existing ristorante.'
      redirect_to ristorante_path
    end
  end
end
