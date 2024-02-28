class VendedorsController < ApplicationController
  before_action :set_vendedor, only: %i[ show edit update destroy ]
  before_action :authenticate_usuario!

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

    if @vendedor.save
      respond_to_vendedor(@vendedor, :created, "Vendedor was successfully created.")
    else
      respond_with_errors(:new)
    end
  end

  # PATCH/PUT /vendedors/1 or /vendedors/1.json
  def update
    if @vendedor.update(vendedor_params)
      respond_to_vendedor(@vendedor, :ok, "Vendedor was successfully updated.")
    else
      respond_with_errors(:edit)
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

  def buscar
    @query = params[:q]
    @vendedors = Vendedor.where("nome LIKE ? OR cpf LIKE ?", "%#{@query}%", "%#{@query}%")
    if @vendedors.empty?
      flash.now[:notice] = "Vendedor não encontrado"
    end

    render :index
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

  # Metodo refatorado de "respond_to" de create e update (sucesso)
  def respond_to_vendedor(vendedor, status, notice)
    respond_to do |format|
      format.html { redirect_to vendedor_url(vendedor), notice: notice }
      format.json { render :show, status: status, location: vendedor }
    end
  end

  # Metodo refatorado de "respond_to" de create e update (erro)
  def respond_with_errors(action)
    respond_to do |format|
      format.html { render action, status: :unprocessable_entity }
      format.json { render json: @vendedor.errors, status: :unprocessable_entity }
    end
  end

end
