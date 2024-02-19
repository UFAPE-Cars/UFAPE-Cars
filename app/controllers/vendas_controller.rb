class VendasController < ApplicationController

  before_action :set_venda, only: %i[show edit update destroy]
  before_action :set_vendedor, only: [:index]

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

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: 'Venda was successfully created.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: 'Venda was successfully updated.' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
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
end
