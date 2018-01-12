# README

Requirements:

Appsmakerstore
European central bank publishing daily rates of pair EUR/USD here:
https://sdw.ecb.europa.eu/quickview.do?SERIES_KEY=120.EXR.D.USD.EUR.SP00.A
1. Write a code that fetching CSV from ecb website.
2. Write a code that puts this data into database (any type of database, whatever you
think is suitable)
3. Write a code allowing to exchange any amount of euros for any period (day, week,
month). For example:
Exchanger.exchange(100, Date.today) => 109.94
Exchanger.exchange(100, [Date.yesterday, Date.today]) =>
[109.94, 110.02]
4. cover it by tests (frameworks like rspec, minitest etc)
5. write documentation how to install, run and use you code
Requirements:
1. DRY
2. KISS
3. log spent hours (for ex. 2h for coding, 2h for tests)
4. there is no requirement for Rails framework, you can write as less code as possible

Results:

## How To Install:

1. ruby 2.3.3 used
2. rails 5.1.3 used
3. install postgres database
4. update `database.yml` with your actual database settings
5. `rake db:create`
6. `rake db:migrate`
7. `rake db:test:prepare`

## How to run tests:

```
rake test
```

## How to use code:

To retrieve all data from remote cvs:
```
Fetcher.fetch
```

Exchange suitable for any string or date or range or array attribute within `Exchanger.exchange(amount, date_or_range_or_array)`: 
```
# string-formatted date:
Exchanger.exchange(100, '2018-01-03')
# date attribute 
Exchanger.exchange(100, Date.parse('2018-01-03'))
# array of string-formatted dates
Exchanger.exchange(100, ['2018-01-01','2018-01-02', '2018-01-03', '2018-01-04'])
# array of dates
Exchanger.exchange(100, [Date.parse('2018-01-01'), Date.parse('2018-01-02'), Date.parse('2018-01-03'), Date.parse('2018-01-04')])
# range of dates
Exchanger.exchange(100, (Date.parse('2018-01-01')..Date.parse('2018-01-05')))
```
if no exchange data for any day, it will return `nil` for that day.

 

