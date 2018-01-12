class Fetcher
  require 'open-uri'
  require 'csv'

  def self.fetch
    if ExchangeRateDollarEuro.count
      puts 'Data already fetched'
      return
    end

    url = "https://sdw.ecb.europa.eu/quickviewexport.do;jsessionid=D48495714FDDE6274617C250EE1D9AAA?SERIES_KEY=120.EXR.D.USD.EUR.SP00.A&type=csv"
    CSV.new(open(url), :headers => :first_row).each do |line|
      begin
        ExchangeRateDollarEuro.create(date: Date.parse(line[0]), rate: line[1])
      rescue => err
        puts err
        sleep 1
      end
    end
  end
end