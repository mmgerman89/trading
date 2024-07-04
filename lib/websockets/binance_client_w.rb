require 'faye/websocket'
require 'eventmachine'
require 'json'
require 'action_cable'

class BinanceClientW
  def initialize
    @ws = nil
  end

  def start
    EM.run {
      url = ENV['BN_WS_URL'] + '/btcusdt@trade'
      @ws = Faye::WebSocket::Client.new(url)
      puts "WebSocket URL: #{url}"
      puts @ws

      @ws.on :open do |event|
        puts 'Connected to Binance WebSocket'
      end

      @ws.on :message do |event|
        data = JSON.parse(event.data)
        process_message(data)
      end

      @ws.on :close do |event|
        puts 'Disconnected from Binance WebSocket'
        puts "Close reason: #{event.reason}" if event.respond_to?(:reason)
        puts "Close code: #{event.code}" if event.respond_to?(:code)
        EM.stop
      end

      @ws.on :error do |event|
        puts 'Error from Binance WebSocket'
        puts event.message
      end
    }
  end

  def process_message(data)
    price = data['p']
    ActionCable.server.broadcast('crypto_channel', { price: price })
    puts data
  end
end
