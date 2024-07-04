class CryptoController < ApplicationController
  def index
    timestamp_ms = crypto_service.get_server_time[1]
    timestamp_s = timestamp_ms / 1000.0
    @server_time  = Time.at(timestamp_s)

    @btc_ticker = crypto_service.get_ticker('BTCUSDT')
    @account_info = crypto_service.get_account_info
    @history = Kline.all.order(open_time: :desc)
  end

  private

  def crypto_service
    @crypto_service ||= CryptoService.new
  end
end
