require "test_helper"

class KlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kline = klines(:one)
  end

  test "should get index" do
    get klines_url
    assert_response :success
  end

  test "should get new" do
    get new_kline_url
    assert_response :success
  end

  test "should create kline" do
    assert_difference("Kline.count") do
      post klines_url, params: { kline: { close: @kline.close, close_time: @kline.close_time, high: @kline.high, low: @kline.low, number_of_trades: @kline.number_of_trades, open: @kline.open, open_time: @kline.open_time, quote_asset_volume: @kline.quote_asset_volume, taker_buy_base_asset_volume: @kline.taker_buy_base_asset_volume, taker_buy_quote_asset_volume: @kline.taker_buy_quote_asset_volume, volume: @kline.volume } }
    end

    assert_redirected_to kline_url(Kline.last)
  end

  test "should show kline" do
    get kline_url(@kline)
    assert_response :success
  end

  test "should get edit" do
    get edit_kline_url(@kline)
    assert_response :success
  end

  test "should update kline" do
    patch kline_url(@kline), params: { kline: { close: @kline.close, close_time: @kline.close_time, high: @kline.high, low: @kline.low, number_of_trades: @kline.number_of_trades, open: @kline.open, open_time: @kline.open_time, quote_asset_volume: @kline.quote_asset_volume, taker_buy_base_asset_volume: @kline.taker_buy_base_asset_volume, taker_buy_quote_asset_volume: @kline.taker_buy_quote_asset_volume, volume: @kline.volume } }
    assert_redirected_to kline_url(@kline)
  end

  test "should destroy kline" do
    assert_difference("Kline.count", -1) do
      delete kline_url(@kline)
    end

    assert_redirected_to klines_url
  end
end
