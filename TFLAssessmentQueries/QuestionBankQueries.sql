-- list all questions  for a subject
select q.title from questionbank q inner join subjects s on q.subject_concept_id=s.id where s.id=1;

-- list all questions for a stubject and concept
select qb.title, qb.a,qb.b,qb.c,qb.d,qb.answerkey from questionbank qb 
 join subject_concepts sc on sc.subject_concept_id=qb.subject_concept_id
 join subjects s on sc.subject_id=s.id
 where s.id=1;
 
-- list  all questions for  a subject with level
select qb.title, qb.a,qb.b,qb.c,qb.d,qb.answerkey from questionbank qb 
 join subject_concepts sc on sc.subject_concept_id=qb.subject_concept_id
 join subjects s on sc.subject_id=s.id
 where s.id=1 and qb.difficulty_level="Beginner";
 
-- list all questions for a subject  , concept   with level
select qb.title, qb.a,qb.b,qb.c,qb.d,qb.answerkey from questionbank qb 
 join subject_concepts sc on sc.subject_concept_id=qb.subject_concept_id
 join subjects s on sc.subject_id=s.id
 where s.id=1 and qb.difficulty_level="Beginner" and sc.concept_id=1;
 
-- list all questions created by
select title,a,b,c,d,answerkey from questionbank where created_by="Ravi Tambade";

-- list all questions creteby , subject
select qb.title,qb.a,qb.b,qb.c,qb.d,qb.answerkey from questionbank qb
 join subject_concepts sc on qb.subject_concept_id=sc.subject_concept_id
 join subjects s on sc.subject_id=s.id
 where s.title="DotNet" and
 created_by="Sanika Bhor";
 
-- list all questions  createdby , subject , concept
select qb.title,qb.a,qb.b,qb.c,qb.d,qb.answerkey from questionbank qb
 join subject_concepts sc on qb.subject_concept_id=sc.subject_concept_id
 join subjects s on sc.subject_id=s.id
 where s.title="DotNet" and
 created_by="Sanika Bhor";
 
-- list all question createdby  , subject, cocept and level
select qb.title,qb.a,qb.b,qb.c,qb.d,qb.answerkey from questionbank qb
 join subject_concepts sc on qb.subject_concept_id=sc.subject_concept_id
 join subjects s on sc.subject_id=s.id
 where s.title="DotNet" and
 created_by="Sanika Bhor";