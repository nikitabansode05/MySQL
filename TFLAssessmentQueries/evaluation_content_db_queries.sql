-- Get all active questions
SELECT question_id,title,description,question_type,difficulty_level from question_bank where status='ACTIVE';

-- Get coding questions only
SELECT question_id,title,description,difficulty_level,status from question_bank where question_type='CODING';

-- Count questions per difficulty
SELECT COUNT(question_id)AS beginner_questions FROM question_bank WHERE difficulty_level='Beginner';
SELECT COUNT(question_id)AS Intermediate_questions FROM question_bank WHERE difficulty_level='Intermediate';
SELECT COUNT(question_id)AS Advanced_questions FROM question_bank WHERE difficulty_level='Advanced';

SELECT 
    difficulty_level,
    COUNT(question_id) AS total_questions
FROM question_bank
GROUP BY difficulty_level;

-- Questions that have problem statements
SELECT question_id,title,description,difficulty_level from question_bank WHERE question_type='PROBLEM_SOLVING';

-- Questions with code snippets
SELECT * from code_snippets ;

-- Questions tagged as mini projects
SELECT * FROM mini_projects;

-- Get subjects of a question
SELECT s.name from subjects s
JOIN subject_concepts sc ON sc.subject_id=s.subject_id 
JOIN question_subject_concept_map qsc ON qsc.subject_concept_id=sc.id
WHERE qsc.question_id=2;

-- Get concepts of a question
SELECT c.name from concepts c
JOIN subject_concepts sc ON sc.concept_id=c.concept_id
JOIN question_subject_concept_map qsc ON qsc.subject_concept_id=sc.id
WHERE qsc.question_id=1;

-- Get all questions of a subject
SELECT qb.question_id,qb.title,qb.description,qb.question_type,qb.difficulty_level FROM question_bank qb
JOIN question_subject_concept_map qsc ON qsc.question_id=qb.question_id
JOIN subject_concepts sc ON sc.id=qsc.subject_concept_id
WHERE sc.subject_id=2;

-- Get coding questions with starter code
SELECT qb.question_id,qb.title,qb.description,qb.question_type,qb.difficulty_level, cs.starter_code
FROM question_bank qb
JOIN code_snippets cs ON cs.question_id=qb.question_id
WHERE question_type='CODING';

-- Mock interview questions
SELECT qb.question_id,qb.title,qb.description,qb.question_type,qb.difficulty_level FROM question_bank qb
WHERE question_type='MOCK_QUESTION';

-- System design questions

-- Find questions without concepts ❌
-- SELECT qb.question_id,qb.title,qb.description,qb.question_type,qb.difficulty_level FROM question_bank qb
-- JOIN question_subject_concept_map qsc ON qsc.question_id=qb.question_id
-- JOIN subject_concepts sc ON sc.id=qsc.subject_concept_id
-- WHERE qb.question_id!=qsc.question_id;

SELECT qb.question_id,
       qb.title,
       qb.description,
       qb.question_type,
       qb.difficulty_level
FROM question_bank qb
LEFT JOIN question_subject_concept_map qsc 
       ON qsc.question_id = qb.question_id
LEFT JOIN subject_concepts sc 
       ON sc.id = qsc.subject_concept_id
WHERE qsc.question_id IS NULL;

-- Questions without starter code
SELECT qb.question_id,qb.title,qb.description,qb.question_type,qb.difficulty_level
 FROM question_bank qb
 JOIN code_snippets cs 
 ON qb.question_id=cs.question_id
 WHERE cs.question_id IS NULL;
 
-- Concepts never used
SELECT c.name
FROM concepts c
LEFT JOIN subject_concepts sc 
       ON sc.concept_id = c.concept_id
LEFT JOIN question_subject_concept_map qsc
       ON qsc.id = qsc.subject_concept_id
WHERE c.name IS NULL;

-- Full question detail (LIKE API RESPONSE)

-- Beginner roadmap

-- Most common subjects

-- Pagination test

-- Random question (quiz mode)