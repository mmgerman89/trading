require 'binance'
# require 'dotenv/load'

class BinanceClient
  def initialize
    @client = Binance::Spot.new(key: ENV['BN_API_KEY'], secret: ENV['BN_API_SECRET_KEY'], base_url: ENV['BN_API_URL'])
    puts "E#{@client.to_json}E"
  end

  def server_time
    @client.time
  end

  def ticker(symbol)
    @client.ticker_24hr(symbol: symbol)
  end

  def account_info
    @client.account
  end
end
