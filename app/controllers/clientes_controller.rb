class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      respond_to_client(@cliente, :created, "Cliente was successfully created.")
    else
      respond_with_errors(:new)
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    if @cliente.update(cliente_params)
      respond_to_client(@cliente, :ok, "Cliente was successfully updated.")
    else
      respond_with_errors(:edit)
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cliente_params
    params.require(:cliente).permit(:nome, :telefone, :email, :idade, :cpf)
  end

  # Metodo refatorado de "respond_to" de create e update (sucesso)
  def respond_to_client(cliente, status, notice)
    respond_to do |format|
      format.html { redirect_to cliente_url(cliente), notice: notice }
      format.json { render :show, status: status, location: cliente }
    end
  end

  # Metodo refatorado de "respond_to" de create e update (erro)
  def respond_with_errors(action)
    respond_to do |format|
      format.html { render action, status: :unprocessable_entity }
      format.json { render json: @cliente.errors, status: :unprocessable_entity }
    end
  end
end