require 'test_helper'

class ExchangerTest < ActiveSupport::TestCase

  test "exchange_for_date_string" do
    assert_equal 167.6, Exchanger.exchange(100, '2018-01-03')
  end

  test "exchange_for_date" do
    assert_equal 167.6, Exchanger.exchange(100, Date.parse('2018-01-03'))
  end

  test "exchange_for_array_of_strings" do
    assert_equal  [113.5, 132.4, 167.6, nil],
                  Exchanger.exchange(100, ['2018-01-01','2018-01-02', '2018-01-03', '2018-01-04'])
  end

  test "exchange_for_array_of_dates" do
    assert_equal  [113.5, 132.4, 167.6, nil],
                  Exchanger.exchange(100, [Date.parse('2018-01-01'), Date.parse('2018-01-02'), Date.parse('2018-01-03'), Date.parse('2018-01-04')])
  end

  test "exchange_for_range" do
    assert_equal  [113.5, 132.4, 167.6, nil, nil],
                  Exchanger.exchange(100, (Date.parse('2018-01-01')..Date.parse('2018-01-05')))
  end
end
