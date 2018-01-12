class Exchanger
  require 'date'

  class << self
    def exchange_for_date(eu_amount, date)
      rate = ExchangeRateDollarEuro.find_by_date(date)&.rate
      rate ? rate * eu_amount : nil
    end

    def exchange_for_array(eu_amount, date_array)
      date_array.collect {|date|
        date = date.is_a?(String) ? Date.parse(date) : date
        exchange_for_date(eu_amount, date)
      }
    end

    def exchange_for_range(eu_amount, date_range)
      date_range.collect do |date|
        exchange_for_date(eu_amount, date)
      end
    end

    def exchange(eu_amount, date_or_range_or_array)
          case date_or_range_or_array
            when String then exchange_for_date(eu_amount, Date.parse(date_or_range_or_array)) rescue nil;
            when Date then exchange_for_date(eu_amount, date_or_range_or_array);
            when Array then exchange_for_array(eu_amount, date_or_range_or_array);
            when Range then exchange_for_range(eu_amount, date_or_range_or_array);
          end
    end
  end
end
