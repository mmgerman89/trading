  require 'binance'
  # require 'dotenv/load'

  class BinanceClient
    def initialize
      @client = Binance::Spot.new(key: ENV['BN_API_KEY'], secret: ENV['BN_API_SECRET_KEY'])
    end

    def server_time
      @client.time.first
    end

    def ticker(symbol)
      @client.ticker_24hr(symbol: symbol)
    end

    def account_info
      #@client.account
    end

    def historical_prices(symbol, interval = '1d', limit = 500)
      @client.klines(symbol: symbol, interval: interval, limit: limit)
    end
  end