

SELECT COUNT(*) AS cnt, subject_name, subject_semtype FROM smdb.predication WHERE subject_cui LIKE '%|%' GROUP BY subject_name, subject_semtype ORDER BY cnt DESC, subject_name;

SELECT count(*) AS cnt, subject_name, subject_semtype, predicate, object_name 
  FROM predication
 WHERE object_name LIKE '%orona%virus%' #and subject_semtype like '%phsu%'
 GROUP BY subject_name, subject_semtype, predicate, object_name  
ORDER BY cnt DESC, subject_name;

SELECT * FROM sentence LIMIT 5; 

SELECT subject_name, subject_semtype, predicate, s.sentence, object_name  
  FROM predication p, sentence s 
 WHERE object_name LIKE '%orona%virus%' #and subject_semtype like '%phsu%'
   AND p.sentence_id = s.sentence_id
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY subject_name;

SELECT PREDICATION_ID, SENTENCE_ID, PMID, PREDICATE, 
 		SUBJECT_CUI, SUBJECT_NAME, SUBJECT_SEMTYPE, SUBJECT_NOVELTY, 
 		OBJECT_CUI, OBJECT_NAME, OBJECT_SEMTYPE, OBJECT_NOVELTY  
 		INTO OUTFILE '/Users/scottalexandermalec/Projects/bioplaus/export.csv' 
 		 FROM predication;

GRANT FILE ON *.* TO 'researcher'@'localhost';

GRANT FILE ON *.* TO 'root'@'%';
Select @@global.secure_file_priv;

SELECT * FROM smdb.predication INTO OUTFILE '/Users/scottalexandermalec/Projects/bioplaus/export.csv' 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SELECT subject_name, subject_semtype, predicate, s.sentence, object_name  
  FROM predication p, sentence s 
 WHERE object_name LIKE '%orona%virus%' and subject_semtype like '%phsu%'
   AND p.sentence_id = s.sentence_id 
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY subject_name LIMIT 5;



SELECT p.subject_name, p.subject_semtype, p.predicate, s.sentence, p.object_name  
  FROM (SELECT * FROM predication WHERE object_name LIKE '%orona%virus%' and subject_semtype like '%phsu%') p, sentence s 
 WHERE #object_name LIKE '%orona%virus%' and subject_semtype like '%phsu%'
   p.sentence_id = s.sentence_id 
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY subject_name LIMIT 5;


SELECT s.sentence #ppp.subject_name, ppp.subject_semtype, ppp.predicate, s.sentence, ppp.object_name  
  FROM sentence s #, predication ppp
 WHERE #ppp.sentence_id = s.sentence_id 
  s.sentence_id IN (SELECT DISTINCT pp.sentence_id  
          FROM predication pp 
         WHERE pp.object_name LIKE '%orona%virus%' and pp.subject_semtype like '%phsu%')
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY sentence LIMIT 5;

SELECT s.sentence, ppp.subject_name, ppp.predicate , ppp.object_name  
  FROM sentence s, predication ppp
 WHERE ppp.sentence_id = s.sentence_id 
   AND s.sentence_id IN (SELECT DISTINCT pp.sentence_id  
          FROM predication pp 
         WHERE pp.object_name LIKE '%orona%virus%')# and pp.subject_semtype = 'phsu')
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY sentence; 

SELECT s.sentence, ppp.subject_name, ppp.predicate , ppp.object_name  
  FROM sentence s, predication ppp
 WHERE ppp.sentence_id = s.sentence_id 
   AND s.sentence_id IN (SELECT DISTINCT pp.sentence_id  
          FROM predication pp 
         WHERE pp.object_name LIKE '%orona%virus%' and pp.subject_semtype = 'phsu')
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY subject_name, predicate, sentence; 



