# config/initializers/binance_websocket.rb

require Rails.root.join('lib', 'websockets', 'binance_client_w')

if Rails.env.development?
  Thread.new do
    BinanceClientW.new.start
  end
end
