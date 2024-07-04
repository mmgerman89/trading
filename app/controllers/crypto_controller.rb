class CryptoController < ApplicationController
  def index
    @assets = [ 'BTCUSDT', 'DOGEUSDT' ]
    timestamp_ms = crypto_service.get_server_time[1]
    timestamp_s = timestamp_ms / 1000.0
    @server_time  = Time.at(timestamp_s)

    @account_info = crypto_service.get_account_info
  end

  def analyze
    @symbol = params[:symbol]
    @btc_ticker = crypto_service.get_ticker(@symbol)

    @history = Kline.where(symbol: @symbol).order(open_time: :desc)

    input_data = @history.map { |kline| { date_time: kline.open_time, close: kline.close } }
    @result_analysis = TechnicalAnalysis::Sma.calculate(input_data, period: 30, price_key: :close) if input_data.count > 0
  end

  private

  def crypto_service
    @crypto_service ||= CryptoService.new
  end
end
