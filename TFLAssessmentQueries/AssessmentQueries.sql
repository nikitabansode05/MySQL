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

-- concept wise correct answer--
SELECT 
            c.id AS concept_id,
            c.title AS concept_name,
            COUNT(qb.id) AS total_questions,
            SUM(CASE 
                    WHEN ca.answerkey = qb.answerkey THEN 1 
                    ELSE 0 
                END) AS correct_answers
        FROM candidateanswers ca
        JOIN questionbank qb ON ca.testquestionid = qb.id
        JOIN concepts c ON qb.subject_concept_id = c.id
        WHERE ca.candidateid = 4
        GROUP BY c.id, c.title;  
        
-- get test details
SELECT q.id AS QuestionId, q.subject_concept_id AS SubjectConceptId, q.title, q.a, q.b, q.c, q.d, q.answerkey
                      FROM questionbank q
                      INNER JOIN testquestions tq ON q.id = tq.questionbankid
                      WHERE tq.testid = 4;
                      
