-- TEST COMMAND AND SAMPLE OUTPUT
-- Record your query (or queries, some clues require more than one) below the clue, then comment out the output below it
-- use two `-` to comment at the start of a line, or highlight the text and press `⌘/` to toggle comments
-- EXAMPLE: SELECT ALL FROM THE TABLE COUNTRY AND LIMIT IT TO ONE ENTRY

SELECT * FROM COUNTRY LIMIT 1;

--  -[ RECORD 1 ]--+--------------------------
-- code           | AFG
-- name           | Afghanistan
-- continent      | Asia
-- region         | Southern and Central Asia
-- surfacearea    | 652090
-- indepyear      | 1919
-- population     | 22720000
-- lifeexpectancy | 45.9
-- gnp            | 5976.00
-- gnpold         |
-- localname      | Afganistan/Afqanestan
-- governmentform | Islamic Emirate
-- headofstate    | Mohammad Omar
-- capital        | 1
-- code2          | AF


-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe, and we'll start looking for her there.
-- SQL COMMAND:
-- SELECT population, name FROM country WHERE region = 'Southern Europe';
-- QUERY RESULTS: 
--  population |             name              
------------+-------------------------------
--     3401200 | Albania
--       78000 | Andorra
--     3972000 | Bosnia and Herzegovina
--    39441700 | Spain
--       25000 | Gibraltar
--    57680000 | Italy
--    10640000 | Yugoslavia
--    10545700 | Greece
--     4473000 | Croatia
--     2024000 | Macedonia
--      380200 | Malta
--     9997600 | Portugal
--       27000 | San Marino
--     1987800 | Slovenia
--        1000 | Holy See (Vatican City State)
-- (15 rows)
-- CLUE #1 ANSWER: She was seen in the Holy See (Vatican City State).

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in this country's officially recognized language. Check our databases and find out what language is spoken in this country, so we can call in a translator to work with you.
-- SQL COMMAND:
-- SELECT countrycode, "language", isofficial, percentage FROM countrylanguage WHERE countrycode = 'VAT';
-- QUERY RESULTS: 
-- countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
--  VAT         | Italian  | t          |          0
-- (1 row)
-- CLUE #2 ANSWER: The official spoken language is Italian.


-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on to a different country, a country where people speak only the language she was learning. Find out which nearby country speaks nothing but that language.
-- SQL COMMAND:
-- SELECT countrycode, "language", isofficial, percentage FROM countrylanguage WHERE isofficial = true AND language = 'Italian';
-- QUERY RESULTS: 
-- countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
--  ITA         | Italian  | t          |       94.1
--  SMR         | Italian  | t          |        100
--  VAT         | Italian  | t          |          0
--  CHE         | Italian  | t          |        7.7
-- (4 rows)
-- CLUE #3 ANSWER: The country of 'San Marino' in 'Southern Europe' speaks only Italian.

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time. There are only two cities she could be flying to in the country. One is named the same as the country – that would be too obvious. We're following our gut on this one; find out what other city in that country she might be flying to.
-- SQL COMMAND:
-- SELECT * FROM city WHERE countrycode = 'SMR' ORDER BY population ASC;
-- QUERY RESULTS: 
--   id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
--  3171 | San Marino | SMR         | San Marino        |       2294
--  3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
-- (2 rows)
-- CLUE #4 ANSWER: The other city that Carmen Sandiego could be flying to is 'Serravalle' in the country of 'San Marino' in 'Southern Europe'.  

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!




-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!




-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the landing dock.

-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but if we can crack it, we can finally put her where she belongs – behind bars.

-- Our playdate of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.


-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.




-- She's in ____________________________!
