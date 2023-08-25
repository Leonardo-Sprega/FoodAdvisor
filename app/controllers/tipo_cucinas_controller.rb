class TipoCucinasController < ApplicationController
  before_action :set_tipo_cucina, only: %i[ show edit update destroy ]

  # GET /tipo_cucinas or /tipo_cucinas.json
  def index
    @tipo_cucinas = TipoCucina.all
  end

  # GET /tipo_cucinas/1 or /tipo_cucinas/1.json
  def show
  end

  # GET /tipo_cucinas/new
  def new
    @tipo_cucina = TipoCucina.new
  end

  # GET /tipo_cucinas/1/edit
  def edit
  end

  # POST /tipo_cucinas or /tipo_cucinas.json
  def create
    @tipo_cucina = TipoCucina.new(tipo_cucina_params)

    respond_to do |format|
      if @tipo_cucina.save
        format.html { redirect_to tipo_cucina_url(@tipo_cucina), notice: "Tipo cucina was successfully created." }
        format.json { render :show, status: :created, location: @tipo_cucina }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_cucina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_cucinas/1 or /tipo_cucinas/1.json
  def update
    respond_to do |format|
      if @tipo_cucina.update(tipo_cucina_params)
        format.html { redirect_to tipo_cucina_url(@tipo_cucina), notice: "Tipo cucina was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_cucina }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_cucina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_cucinas/1 or /tipo_cucinas/1.json
  def destroy
    @tipo_cucina.destroy

    respond_to do |format|
      format.html { redirect_to tipo_cucinas_url, notice: "Tipo cucina was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_cucina
      @tipo_cucina = TipoCucina.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_cucina_params
      params.require(:tipo_cucina).permit(:nome, :descrizione)
    end
end
