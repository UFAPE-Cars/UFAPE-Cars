class VendedorsController < ApplicationController
  before_action :set_vendedor, only: %i[ show edit update destroy ]

  # GET /vendedors or /vendedors.json
  def index
    @vendedors = Vendedor.all
  end

  # GET /vendedors/1 or /vendedors/1.json
  def show
  end

  # GET /vendedors/new
  def new
    @vendedor = Vendedor.new
  end

  # GET /vendedors/1/edit
  def edit
  end

  # POST /vendedors or /vendedors.json
  def create
    @vendedor = Vendedor.new(vendedor_params)

    respond_to do |format|
      if @vendedor.save
        format.html { redirect_to vendedor_url(@vendedor), notice: "Vendedor was successfully created." }
        format.json { render :show, status: :created, location: @vendedor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendedors/1 or /vendedors/1.json
  def update
    respond_to do |format|
      if @vendedor.update(vendedor_params)
        format.html { redirect_to vendedor_url(@vendedor), notice: "Vendedor was successfully updated." }
        format.json { render :show, status: :ok, location: @vendedor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedors/1 or /vendedors/1.json
  def destroy
    @vendedor.destroy

    respond_to do |format|
      format.html { redirect_to vendedors_url, notice: "Vendedor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Adicionando a ação de buscar
  def buscar
    query = params[:q]
    @vendedors = Vendedor.where('nome LIKE ? OR cpf = ?', "%#{query}%", query)
    render :index  # Pode optar por renderizar uma view específica para resultados de busca
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vendedor
    @vendedor = Vendedor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vendedor_params
    params.require(:vendedor).permit(:nome, :idade, :cpf, :comissao)
  end
end
