class CryptoController < ApplicationController
  def index
    @server_time = crypto_service.get_server_time
    @btc_ticker = crypto_service.get_ticker('BTCUSDT')
    puts "a#{@btc_ticker}a"
    @account_info = crypto_service.get_account_info
  end

  private

  def crypto_service
    @crypto_service ||= CryptoService.new
  end
end
