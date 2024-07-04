class KlinesController < ApplicationController
  before_action :set_kline, only: %i[ show edit update destroy ]

  # GET /klines or /klines.json
  def index
    @klines = Kline.all
  end

  # GET /klines/1 or /klines/1.json
  def show
  end

  # GET /klines/new
  def new
    @kline = Kline.new
  end

  # GET /klines/1/edit
  def edit
  end

  # POST /klines or /klines.json
  def create
    @kline = Kline.new(kline_params)

    respond_to do |format|
      if @kline.save
        format.html { redirect_to kline_url(@kline), notice: "Kline was successfully created." }
        format.json { render :show, status: :created, location: @kline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /klines/1 or /klines/1.json
  def update
    respond_to do |format|
      if @kline.update(kline_params)
        format.html { redirect_to kline_url(@kline), notice: "Kline was successfully updated." }
        format.json { render :show, status: :ok, location: @kline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klines/1 or /klines/1.json
  def destroy
    @kline.destroy!

    respond_to do |format|
      format.html { redirect_to klines_url, notice: "Kline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Custom method to process and save Kline data
  def process_and_save
    symbol = 'BTCUSDT'
    kline_data = crypto_service.get_history(symbol)

    kline_data.each do |data|
      timestamp_s = data[0] / 1000.0
      open_time  = Time.at(timestamp_s)

      timestamp_s = data[6] / 1000.0
      close_time  = Time.at(timestamp_s)

      kline = Kline.find_by(symbol: symbol, open_time: open_time, close_time: close_time)
      if kline
        puts "Ya existe kline: #{kline}"
        kline.update(
          open: data[1].to_d,
          high: data[2].to_d,
          low: data[3].to_d,
          close: data[4].to_d,
          volume: data[5].to_d,
          quote_asset_volume: data[7].to_d,
          number_of_trades: data[8],
          taker_buy_base_asset_volume: data[9].to_d,
          taker_buy_quote_asset_volume: data[10].to_d
        )
      else
        kline = Kline.create(
          symbol: symbol,
          open_time: open_time,
          open: data[1].to_d,
          high: data[2].to_d,
          low: data[3].to_d,
          close: data[4].to_d,
          volume: data[5].to_d,
          close_time: close_time,
          quote_asset_volume: data[7].to_d,
          number_of_trades: data[8],
          taker_buy_base_asset_volume: data[9].to_d,
          taker_buy_quote_asset_volume: data[10].to_d
        )
        puts "Nuevo kline creado: #{kline}"
      end
    end
    
    respond_to do |format|
      format.html { redirect_to crypto_path, notiche: 'Actuaizado' }
      format.json { render :index, status: :created }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kline
      @kline = Kline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kline_params
      params.require(:kline).permit(:symbol, :open_time, :open, :high, :low, :close, :volume, :close_time, :quote_asset_volume, :number_of_trades, :taker_buy_base_asset_volume, :taker_buy_quote_asset_volume)
    end

    def crypto_service
      @crypto_service ||= CryptoService.new
    end
end
