class CreateExchangeRateDollarEuros < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_rate_dollar_euros do |t|
      t.datetime :date
      t.float :rate
      t.timestamps
    end
  end
end
