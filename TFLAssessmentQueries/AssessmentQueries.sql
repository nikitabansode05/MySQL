-- get assessmets details (sme details)--  
SELECT t.id, t.smeid AS subjectExpertId, t.subjectid AS subjectId,t.name AS AssessmentName,
CONCAT(e.firstName," ", e.lastName) AS smeName,t.status,t.passinglevel,
t.creationdate AS creationDate,t.modificationdate AS modificationDate,t.scheduleddate AS scheduledDate
FROM   tests t
LEFT JOIN employees e ON t.smeid = e.id 
JOIN assessments a ON t.id=a.test_id
WHERE a.id = 4;

-- get assessmets details (student details)--  
SELECT t.id, t.smeid AS subjectExpertId, t.subjectid AS subjectId,CONCAT(e.firstName," ", e.lastName) AS candidateName,
t.name AS AssessmentName,t.status,t.passinglevel,
t.creationdate AS creationDate,t.modificationdate AS modificationDate,t.scheduleddate AS scheduledDate
FROM   tests t
JOIN assessments a ON t.id=a.test_id
LEFT JOIN employees e ON a.candidate_id = e.id 
WHERE a.id = 4;

-- get assessmets details (student and sme details)--  
SELECT t.id, t.smeid AS subjectExpertId,  t.subjectid AS subjectId,
CONCAT(candidate.firstName ," ", candidate.lastName )AS candidateName,t.name AS AssessmentName,t.status,t.passinglevel,
CONCAT(sme.firstName," ",sme.lastName) AS smeName,t.creationdate AS creationDate,
t.modificationdate AS modificationDate,t.scheduleddate AS scheduledDate
FROM   tests t
JOIN assessments a ON t.id=a.test_id
LEFT JOIN employees candidate ON a.candidate_id = candidate.id 
LEFT JOIN employees sme ON t.smeid = sme.id 
WHERE a.id = 4;