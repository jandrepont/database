---5 Basic Queries :

---List all subtopics of the topic with given ID:
WITH topic_tree AS (select *
from topic t1,  has_subtopic hs
where (t1.topic_id = &tpn) AND (hs.parent_id = t1.topic_id))
SELECT t1.title
FROM topic_tree tt, topic t1
where t1.topic_id = tt.child_id;

--- List titles of all recommendations by a user
SELECT title
FROM document d1
WHERE d1.doc_id =
(SELECT doc_id
FROM usr, recommended_docs rs
WHERE usr.usr_id = rs.usr_id);

--- User ID of the users interested in the topic "Statistics" :
SELECT usr.usr_id
FROM usr, has_interest hi
WHERE usr.usr_id = hi.usr_id AND hi.topic_id = 'Statistics';

--- Name and id of authors who have published at least one book between 1980 and 1990 :
SELECT DISTINCT author_id, name
FROM author a, written_by wb, has_reference hr
WHERE a.author_id = wb.author_id AND wb.url_ = hr.reference
AND COUNT(hr.reference) >= 2;

---Document ID of the documents which concern any topic taught in the major "Physics" :
SELECT DISTINCT d.doc_id
FROM document d, has_topic ht, is_taught it
WHERE d.doc_id = ht.doc_id AND ht.topic_id = is.topic_id AND majorName = 'Physics';

---List all authors of all papers:
SELECT a.name_, title
FROM (document d NATURAL JOIN written_by wb), author a
WHERE wb.author_id = a.author_id;



---3 Complex Queries :

---Name and id of authors that are referenced at least 2 times :
SELECT a.author_id, a.name_
FROM author a, written_by wb, has_reference hr
WHERE a.author_id = wb.author_id AND wb.doc_id = hr.doc_id
GROUP BY a.author_id, a.name_
HAVING COUNT(hr.reference) >= 2;

---Topics which have at least three subtopics
SELECT DISTINCT topic_id, title
FROM topic
WHERE topic_id IN
(SELECT topic_id
FROM topic t, has_subtopic hs
WHERE t.topic_id = has_subtopic.child_id
GROUP BY t.topic_id
HAVING COUNT(*) >= 3);

--- Document ID of the documents graded 5, for each major :
SELECT rd.majorName, rd.doc_id
FROM recommended_docs rd, major m, document d
WHERE rd.majorName = m.majorName AND rd.doc_id = d.doc_id AND grade = 5
GROUP BY rd.majorName, rd.doc_id;
