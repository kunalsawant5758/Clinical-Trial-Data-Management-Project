-- 1 Missing values
SELECT * FROM DM WHERE Sex IS NULL OR Sex='';
SELECT * FROM MH WHERE `Condition` IS NULL OR `Condition`='';
SELECT * FROM CM WHERE StartDate IS NULL OR StartDate='';
SELECT * FROM AE WHERE EventTerm IS NULL OR EventTerm='' OR Outcome IS NULL OR Outcome='';

-- 2 Age range
SELECT * FROM DM WHERE Age<18 OR Age>80;

-- 3 Duplicate subjects
SELECT SubjectID,COUNT(*)
FROM DM
GROUP BY SubjectID
HAVING COUNT(*)>1;

-- 4 Future dates
SELECT *
FROM MH
WHERE DiagnosisDate > CURRENT_DATE;

-- 5 Negative values
SELECT *
FROM CM
WHERE Dose < 0;

-- 6 AE date logic
SELECT *
FROM AE
WHERE EndDate < StartDate;

-- 7 Lab range check
SELECT *
FROM LB
WHERE HbA1c IS NULL
   OR FastingGlucose > 500;
   
-- 8 Vital sign range check
SELECT *
FROM VS
WHERE SystolicBP > 250
   OR DiastolicBP < 30
   OR Pulse > 200
   OR Weight_kg < 0;

