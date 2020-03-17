SELECT COUNT(*) AS cnt, subject_name, subject_semtype 
  FROM splpredications 
 WHERE object_cui LIKE '%|%' 
 GROUP BY subject_name, subject_semtype 
ORDER BY cnt DESC, subject_name;

SELECT COUNT(*) AS cnt, subject_name, subject_semtype 
  FROM smdbcausalpreds
 WHERE subject_name LIKE '%orona%virus%' 
 GROUP BY subject_name, subject_semtype 
ORDER BY cnt DESC, subject_name;

SELECT count(*), subject_name, subject_semtype, predicate, object_name 
  FROM smdbcausalpreds
 WHERE object_name LIKE '%orona%virus%' and subject_semtype like '%phsu%'
 GROUP BY subject_name, subject_semtype, predicate, object_name  
ORDER BY subject_name;

SELECT s.sentence, ppp.subject_name, ppp.predicate , ppp.object_name  
  FROM splsentences s, splpredications ppp
 WHERE ppp.section_sentence_id = s.section_sentence_id 
   and ppp.section_predication_id = s.section_predication_id 
   AND s.section_sentence_id IN (SELECT DISTINCT pp.section_sentence_id  
          FROM splpredications pp 
         WHERE pp.object_name LIKE '%orona%') -- and pp.subject_semtype = 'phsu')
 --GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY subject_name, predicate, sentence; 





