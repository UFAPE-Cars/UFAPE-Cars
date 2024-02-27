class VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[ show edit update destroy ]
  # before_action :authenticate_usuario!

  # GET /veiculos or /veiculos.json
  def index
    @veiculos = Veiculo.all
  end

  # GET /veiculos/1 or /veiculos/1.json
  def show
  end

  # GET /veiculos/buscar
  def buscar
    if params.key?('limite_inferior')
      limite_inferior = params[:limite_inferior]
      limite_superior = params[:limite_superior]

      if limite_inferior.empty?
        limite_inferior = 0.0
      end

      if limite_superior.empty?
        limite_superior = 9999999.0
      end

      busca = "valor_anuncio >= #{limite_inferior} AND valor_anuncio <= #{limite_superior}"

      if not params[:modelo].empty?
        busca += " AND modelo LIKE '%#{params[:modelo]}%'"
      end
      
      if not params[:uso].nil? and not params[:uso].eql? "Todos"
        busca += " AND uso = '#{params[:uso]}'"
      end
      
      @veiculos = Veiculo.where(busca)
    else
      @veiculos = Veiculo.all
    end
    
    render :buscar
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos or /veiculos.json
  def create
    @veiculo = Veiculo.new(veiculo_params)

    if @veiculo.save
      responde_to_veiculo(@veiculo, :created, "Veiculo was successfully created.")
    else
      respond_with_errors(:new)
    end
  end

  # PATCH/PUT /veiculos/1 or /veiculos/1.json
  def update
    if @veiculo.update(veiculo_params)
      responde_to_veiculo(@veiculo, :created, "Veiculo was successfully updated.")
    else
      respond_with_errors(:edit)
    end
  end

  # DELETE /veiculos/1 or /veiculos/1.json
  def destroy
    @veiculo.destroy

    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: "Veiculo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def veiculo_params
      params.require(:veiculo).permit(:modelo, :ano, :quilometragem, :uso, :historico_manutencao, :tabela_fipe, :valor_anuncio)
    end


  # Metodo refatorado de "respond_to" de create e update (sucesso)
  def responde_to_veiculo(veiculo, status, notice)
    respond_to do |format|
      format.html { redirect_to veiculo_url(veiculo), notice: notice }
      format.json { render :show, status: status, location: veiculo }
    end
  end

  # Metodo refatorado de "respond_to" de create e update (erro)
  def respond_with_errors(action)
    respond_to do |format|
      format.html { render action, status: :unprocessable_entity }
      format.json { render json: @veiculo.errors, status: :unprocessable_entity }
    end
  end
end
