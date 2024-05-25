class CryptoService
  def initialize(binance_client = BinanceClient.new)
    @binance_client = binance_client
  end

  def get_server_time
    @binance_client.server_time
  end

  def get_ticker(symbol)
    @binance_client.ticker(symbol)
  end

  def get_account_info
    @binance_client.account_info
  end
end
