class CreateKlines < ActiveRecord::Migration[7.1]
  def change
    create_table :klines do |t|
      t.string :symbol
      t.datetime :open_time
      t.decimal :open
      t.decimal :high
      t.decimal :low
      t.decimal :close
      t.decimal :volume
      t.datetime :close_time
      t.decimal :quote_asset_volume
      t.integer :number_of_trades
      t.decimal :taker_buy_base_asset_volume
      t.decimal :taker_buy_quote_asset_volume

      t.timestamps
    end
  end
end
