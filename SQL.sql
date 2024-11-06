SELECT * FROM olubunmi.netflix_movies;

-- To rename column--  
ALTER TABLE olubunmi.netflix_movies
RENAME COLUMN `lister-item-header`
TO movies;

-- To rename column-- 
ALTER TABLE olubunmi.netflix_movies
RENAME COLUMN `movies`
TO title;

-- To rename column-- 
ALTER TABLE olubunmi.netflix_movies
RENAME COLUMN `lister-item-index`
TO id;

-- Select title of movies that have ratings greater than 6-- 
SELECT title, rating
FROM olubunmi.netflix_movies
WHERE rating > 6;

-- Practice questions-- 
-- retrieve all titles of movies with genre as drama--  
SELECT title, genre AS category
FROM olubunmi.netflix_movies
WHERE genre= 'drama';

-- get the -- titles and runtimes of movies with a rating greater than or equal to 8.0-- 
SELECT title, runtime, rating
FROM olubunmi.netflix_movies
WHERE rating>= '8.0';

-- retreive all titles of movies with a runtime longer than 60 min-- 
SELECT title, runtime, rating
FROM olubunmi.netflix_movies
WHERE runtime > '60 min';

-- get the titles and certificates of movies with genre as action and rating above 7.5-- 
SELECT title, certificate, genre, rating
FROM olubunmi.netflix_movies
WHERE genre= 'action'
AND rating > 7.5;

-- find the ratings of movies with runtime at 60 min-- 
SELECT title, rating, runtime
FROM olubunmi.netflix_movies
WHERE runtime = '60 min';

-- find the titles and genres of movies with a runtime above 60 min
SELECT title, genre, runtime
 FROM olubunmi.netflix_movies
 WHERE runtime > '60 min';
 
-- retrieve titles and runtimes of movies with rating between 6.0 and 8.0
SELECT title, runtime, rating
FROM olubunmi.netflix_movies
WHERE rating > 6.0 AND 8.0;

-- find title, ratings and runtime of movies with votes above 100,000
SELECT title, rating, runtime, votes
FROM olubunmi.netflix_movies
WHERE votes > '100000';

-- practice 2
-- retreive the top 10 highest-rated movies 
SELECT title, rating AS highest_rated
FROM olubunmi.netflix_movies
LIMIT 10;

-- find the total number of votes received by movie 
SELECT title, SUM(votes) AS total_votes
FROM olubunmi.netflix_movies
GROUP BY title
ORDER BY title ASC;

-- caculate the average runtime of movies in each genre
SELECT genre, AVG(runtime) AS avg_runtime
FROM olubunmi.netflix_movies
GROUP BY genre
ORDER BY genre ASC;

-- calculate the total number of votes received by movies, and show only the movies with more than 100000 total votes
SET SQL_SAFE_UPDATES = 0;
UPDATE olubunmi.netflix_movies
SET VOTES = REPLACE(votes, ',', '');
ALTER TABLE olubunmi.netflix_movies
MODIFY COLUMN votes INT;

SELECT * FROM olubunmi.netflix_movies;

SELECT SUM(votes) as total_votes, title
FROM olubunmi.netflix_movies
GROUP BY title
HAVING SUM(votes) > 100000;

-- determine the maximum and minimum runtime of movies in each genre
SELECT MAX(runtime), MIN(runtime), genre
FROM olubunmi.netflix_movies
GROUP BY genre;