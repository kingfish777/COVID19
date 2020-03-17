
SELECT s.sentence, ppp.subject_name, ppp.predicate , ppp.object_name  
  FROM sentence s, predication ppp
 WHERE ppp.sentence_id = s.sentence_id 
   AND s.sentence_id IN (SELECT DISTINCT pp.sentence_id  
          FROM predication pp 
         WHERE pp.object_name LIKE '%orona%virus%' and pp.subject_semtype = 'phsu')
 #GROUP BY subject_name, subject_semtype, predicate, object_name, s.sentence  
ORDER BY subject_name, predicate, sentence; 

