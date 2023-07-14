--This was used to insert some of the missing manufacturers(Mercedes-Benz,Porsche & TATA motors)--
INSERT INTO [automakers_stocks_2010-2022](Date, [Open], High, Low, [Close], Adj_Close, Volume)
SELECT Date, [Open], High, Low, [Close], Adj_Close, Volume
FROM [MBG.DE]

INSERT INTO [automakers_stocks_2010-2022](Date, [Open], High, Low, [Close], Adj_Close, Volume)
SELECT Date, [Open], High, Low, [Close], Adj_Close, Volume
FROM [P911.DE]

INSERT INTO [automakers_stocks_2010-2022](Date, [Open], High, Low, [Close], Adj_Close, Volume)
SELECT Date, [Open], High, Low, [Close], Adj_Close, Volume
FROM [TATAMOTORS.NS]
	
--This was used to fill up the NULL values where the Symbol was missing--
UPDATE [automakers_stocks_2010-2022]
SET Symbol = 'MBG.DE' 
WHERE Symbol is NULL

UPDATE [automakers_stocks_2010-2022]
SET Symbol = 'P911.DE' 
WHERE Symbol is NULL

UPDATE [automakers_stocks_2010-2022]
SET Symbol = 'TATAMOTORS.NS' 
WHERE Symbol is NULL

--Using inner join to merge the two tables with specific columns.
SELECT car_stock.Date,car_names.Name, car_names.Symbol,car_names.country,car_names.Rank,car_names.price_USD,
	   car_stock.Adj_Close,car_stock.Close_,car_stock.Open_, car_stock.High,car_stock.Low,car_stock.Volume
FROM Largest_automakers_by_market_capitalization AS car_names

INNER JOIN [automakers_stocks_2010-2022] AS car_stock
ON car_names.Symbol = car_stock.Symbol

--N.B: The results were saved as [Top 50 Automakers] and used for the Analysis Process--

--Ranking the most valuable Car manufacturers--
SELECT DISTINCT(Name),rank
FROM [Top 50 Automakers]
ORDER BY rank

--Comparison of the average adjusted closing price across 10 years--
WITH cte1 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2012'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2012-01-01' AND '2012-12-31'
GROUP BY Name) ,
	 
	 cte2 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2013'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY Name) ,

	cte3 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2014'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2014-01-01' AND '2014-12-31'
GROUP BY Name) ,

	cte4 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2015'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY Name) ,

	cte5 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2016'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY Name) ,

	cte6 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2017'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY Name) ,

	cte7 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2018'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY Name) ,

	cte8 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2019'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY Name) ,

	cte9 AS (SELECT DISTINCT[Name] AS Auto_name,AVG(adjusted_close_price) AS '2020'
FROM [Top 50 Automakers]
WHERE Date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY Name) 



SELECT cte1.Auto_name, cte1.[2012], cte2.[2013], cte3.[2014], 
	   cte4.[2015], cte5.[2016], cte6.[2017], cte7.[2018], cte8.[2019], cte9.[2020]
FROM cte2
LEFT JOIN cte1
ON cte2.Auto_name = cte1.Auto_name
LEFT JOIN cte3
ON cte2.Auto_name = cte3.Auto_name
LEFT JOIN cte4
ON cte2.Auto_name = cte4.Auto_name
LEFT JOIN cte5
ON cte2.Auto_name = cte5.Auto_name
LEFT JOIN cte6
ON cte2.Auto_name = cte6.Auto_name
LEFT JOIN cte7
ON cte2.Auto_name = cte7.Auto_name
LEFT JOIN cte8
ON cte2.Auto_name = cte8.Auto_name
LEFT JOIN cte9
ON cte2.Auto_name = cte9.Auto_name





