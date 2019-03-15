
WITH topic_tree AS (select *
from topic t1,  has_subtopic hs 
where (t1.topic_id = &tpn) AND (hs.parent_id = t1.topic_id))
SELECT t1.title 
FROM topic_tree tt, topic t1
where t1.topic_id = tt.child_id;

SELECT DISTINCT author_id, name
FROM author a, written_by wb, has_reference hr
WHERE a.author_id = wb.author_id AND wb.url_ = hr.reference 
AND COUNT(hr.reference) >= 2;

SELECT DISTINCT topic_id, title
FROM topic
WHERE topic_id IN 
(SELECT topic_id
FROM topic t, has_subtopic hs
WHERE t.topic_id = has_subtopic.child_id
GROUP BY t.topic_id
HAVING COUNT(*) >= 3);











