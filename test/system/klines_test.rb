require "application_system_test_case"

class KlinesTest < ApplicationSystemTestCase
  setup do
    @kline = klines(:one)
  end

  test "visiting the index" do
    visit klines_url
    assert_selector "h1", text: "Klines"
  end

  test "should create kline" do
    visit klines_url
    click_on "New kline"

    fill_in "Close", with: @kline.close
    fill_in "Close time", with: @kline.close_time
    fill_in "High", with: @kline.high
    fill_in "Low", with: @kline.low
    fill_in "Number of trades", with: @kline.number_of_trades
    fill_in "Open", with: @kline.open
    fill_in "Open time", with: @kline.open_time
    fill_in "Quote asset volume", with: @kline.quote_asset_volume
    fill_in "Taker buy base asset volume", with: @kline.taker_buy_base_asset_volume
    fill_in "Taker buy quote asset volume", with: @kline.taker_buy_quote_asset_volume
    fill_in "Volume", with: @kline.volume
    click_on "Create Kline"

    assert_text "Kline was successfully created"
    click_on "Back"
  end

  test "should update Kline" do
    visit kline_url(@kline)
    click_on "Edit this kline", match: :first

    fill_in "Close", with: @kline.close
    fill_in "Close time", with: @kline.close_time
    fill_in "High", with: @kline.high
    fill_in "Low", with: @kline.low
    fill_in "Number of trades", with: @kline.number_of_trades
    fill_in "Open", with: @kline.open
    fill_in "Open time", with: @kline.open_time
    fill_in "Quote asset volume", with: @kline.quote_asset_volume
    fill_in "Taker buy base asset volume", with: @kline.taker_buy_base_asset_volume
    fill_in "Taker buy quote asset volume", with: @kline.taker_buy_quote_asset_volume
    fill_in "Volume", with: @kline.volume
    click_on "Update Kline"

    assert_text "Kline was successfully updated"
    click_on "Back"
  end

  test "should destroy Kline" do
    visit kline_url(@kline)
    click_on "Destroy this kline", match: :first

    assert_text "Kline was successfully destroyed"
  end
end
