require 'rails_helper'

RSpec.describe CryptoService, type: :service do
  let(:binance_client) { double("BinanceClient") }
  let(:crypto_service) { described_class.new(binance_client) }

  describe "#get_server_time" do
    it "returns the server time" do
      time_response = { "serverTime" => 1635543478913 }
      allow(binance_client).to receive(:server_time).and_return(time_response)

      expect(crypto_service.get_server_time).to eq(time_response)
    end
  end

  describe "#get_ticker" do
    it "returns the ticker information" do
      ticker_response = { "lastPrice" => "50000.00" }
      allow(binance_client).to receive(:ticker).with('BTCUSDT').and_return(ticker_response)

      expect(crypto_service.get_ticker('BTCUSDT')).to eq(ticker_response)
    end
  end

  describe "#get_account_info" do
    it "returns the account information" do
      account_response = { "balances" => [{ "asset" => "BTC", "free" => "0.1" }] }
      allow(binance_client).to receive(:account_info).and_return(account_response)

      expect(crypto_service.get_account_info).to eq(account_response)
    end
  end
end
