--1
-- CREATE TABLE Calls(
--     callID INT UNSIGNED PRIMARY KEY,
--     numberDialled VARCHAR(15) NOT NULL, 
--     callDateTime DATETIME,
--     userExt INT UNSIGNED,
--     result ENUM('Voicemail', 'Wrong Number', 'Answered') NOT NULL
-- );


--2
-- SELECT DATE(callDateTime) AS 'date',
--        userExt AS 'user',
--        COUNT(*) AS 'callsMade'
-- FROM Calls
-- GROUP BY userExt,
--          CAST(callDateTime AS DATE)
-- ORDER BY 'user',
--          'date'




--3.1 SOLUTION A ORDER BY PHONE NUMBER
-- SELECT numberDialled AS 'number',
--     COUNT(*) AS 'frequency'
-- FROM Calls
-- GROUP BY numberDialled
-- ORDER BY numberDialled

--3.2 SOLUTION B ORDER BY NUMBER OF TIME NUMBER IS CALLED
-- SELECT numberDialled AS 'number',
--        COUNT(*) AS 'frequency'
-- FROM Calls
-- GROUP BY numberDialled
-- ORDER BY COUNT(numberDialled) DESC

--4
-- SELECT *, B.frequency
-- FROM Calls as A
-- INNER JOIN (SELECT numberDialled, COUNT(*) AS Frequency FROM Calls GROUP BY numberDialled) AS B
-- ON A.numberDialled = B.numberDialled


--5
-- SELECT DATE(callDateTime) AS 'date',
--        userExt AS 'user',
--        ROUND(AVG(result = 'Answered'), 1) AS answeredPercent
-- FROM Calls
-- GROUP BY userExt,
--          CAST(callDateTime AS DATE)
-- ORDER BY 'user',
--          'date'

--6
-- SELECT numberDialled, COUNT(*) AS timesCalled
-- FROM Calls
-- GROUP BY numberDialled
-- ORDER BY COUNT(*) DESC
-- LIMIT 10

--7
-- SELECT  DISTINCT userExt AS 'usersSlacking'
-- FROM Calls
-- GROUP BY userExt
-- HAVING COUNT(*) < 100



--8
-- SELECT DATE(callDateTime) AS 'date',
--        TIMEDIFF(MAX(callDateTime), MIN(callDateTime)) AS punchOut,
--        userExt AS 'user',
--        COUNT(*) AS 'callsMade'
-- FROM Calls
-- GROUP BY userExt,
--          CAST(callDateTime AS DATE)
-- ORDER BY 'user',
--          'date'