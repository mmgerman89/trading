json.extract! kline, :id, :open_time, :open, :high, :low, :close, :volume, :close_time, :quote_asset_volume, :number_of_trades, :taker_buy_base_asset_volume, :taker_buy_quote_asset_volume, :created_at, :updated_at
json.url kline_url(kline, format: :json)
