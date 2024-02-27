class VendasController < ApplicationController

  before_action :set_venda, only: %i[show edit update destroy]
  before_action :set_vendedor, only: [:index]
  # before_action :authenticate_usuario!

  def index
    if @vendedor
      @vendas = @vendedor.vendas
    else
      @vendas = Venda.all
    end
  end

  def show
  end

  def new
    @venda = Venda.new
    @clientes = Cliente.all
    @veiculos = Veiculo.all
    @vendedores = Vendedor.all
  end

  def edit
  end

  def create
    @venda = Venda.new(venda_params)

    if @venda.save
      respond_to_venda(@venda, :created, 'Venda was successfully created.')
    else
      respond_with_errors(:new)
    end
  end

  def update
    if @venda.update(venda_params)
      respond_to_venda(@venda, :ok, 'Venda was successfully updated.')
    else
      respond_with_errors(:edit)
    end
  end

  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to vendas_url, notice: 'Venda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_venda
    @venda = Venda.find(params[:id])
  end

  def set_vendedor
    @vendedor = Vendedor.find(params[:vendedor_id]) if params[:vendedor_id]
  end

  def venda_params
    params.require(:venda).permit(:cliente_id, :veiculo_id, :vendedor_id, :valor, :status, :quantidade_veiculos)
  end


  # Metodo refatorado de "respond_to" de create e update (sucesso)
  def respond_to_venda(venda, status, notice)
    respond_to do |format|
      format.html { redirect_to venda_url(venda), notice: notice }
      format.json { render :show, status: status, location: venda }
    end
  end

  # Metodo refatorado de "respond_to" de create e update (erro)
  def respond_with_errors(action)
    respond_to do |format|
      format.html { render action, status: :unprocessable_entity }
      format.json { render json: @venda.errors, status: :unprocessable_entity }
    end
  end
end
