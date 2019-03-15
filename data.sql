delete from usr;
delete from topic;
delete from has_subtopic;
delete from has_topic;
delete from document;
delete from book;
delete from paper;
delete from notes;
delete from author;
delete from written_by;
delete from has_reference;
delete from major;
delete from is_taught;
delete from has_interest;
delete from recommended_docs;
------------------------------------ Usr data ------------------------------------
INSERT INTO usr(usr_id, first_name, email) values ('joel91', 'joel', 'joel@mail.com');

------------------------------------ Topic data ------------------------------------
INSERT INTO topic(topic_id, title) values (0, 'Machine Learning');
INSERT INTO topic(topic_id, title) values (1, 'Computer Science');
INSERT INTO topic(topic_id, title) values (2, 'Analysis');
INSERT INTO topic(topic_id, title) values (3, 'Statistics');

INSERT INTO topic(topic_id, title) values (4, 'Computer Vision');
INSERT INTO topic(topic_id, title) values (5, 'Numerical Methods');
INSERT INTO topic(topic_id, title) values (6, 'Numerical Analysis');

INSERT INTO topic(topic_id, title) values (7, 'Numerical Optimization');
INSERT INTO topic(topic_id, title) values (8, 'Differential Equations');
INSERT INTO topic(topic_id, title) values (9, 'Finite Elements Method');
INSERT INTO topic(topic_id, title) values (10, 'Finite Differences');

INSERT INTO topic(topic_id, title) values (11, 'Algorithms');
INSERT INTO topic(topic_id, title) values (12, 'Linear Algebra');


------------------------------------ Has_subtopic data ------------------------------------
INSERT INTO has_subtopic(child_id, parent_id) values (0, 3);

INSERT INTO has_subtopic(child_id, parent_id) values (1, 1);

INSERT INTO has_subtopic(child_id, parent_id) values (2, 2);

INSERT INTO has_subtopic(child_id, parent_id) values (3, 2);

INSERT INTO has_subtopic(child_id, parent_id) values (4, 0);

INSERT INTO has_subtopic(child_id, parent_id) values (5, 6);

INSERT INTO has_subtopic(child_id, parent_id) values (6, 2);

INSERT INTO has_subtopic(child_id, parent_id) values (7, 2)

INSERT INTO has_subtopic(child_id, parent_id) values (8, 2);

INSERT INTO has_subtopic(child_id, parent_id) values (9, 11);

INSERT INTO has_subtopic(child_id, parent_id) values (11, 1);

INSERT INTO has_subtopic(child_id, parent_id) values (12, 12);

------------------------------------ Has_topic data ------------------------------------
INSERT INTO has_topic(topic_id, url_) values (0, 1);

------------------------------------ Document data ------------------------------------
INSERT INTO document(doc_id, url_, dop, title) values (0, 'https://arxiv.org/pdf/1903.03571.pdf', TO_DATE('2019-03-08', 'yyyy-mm-dd'), 'Rates of Convergence for Sparse Variational Gaussian Process Regression');
INSERT INTO document(doc_id, url_, dop, title) values (1, 'http://www.math.harvard.edu/~shlomo/docs/Advanced_Calculus.pdf', TO_DATE('1990', 'yyyy'), 'Advanced Calculus');

------------------------------------ Book data ------------------------------------
INSERT INTO book(doc_id, doi, publisher) values (1, 'https://doi.org/10.1142/9095', 'Jones and Bartlett');


------------------------------------ Paper data ------------------------------------
INSERT INTO paper(doc_id, journal) values (0, NULL);


------------------------------------ Notes data ------------------------------------


------------------------------------ Author data ------------------------------------
INSERT INTO author(author_id, name_) VALUES (0, 'David R. Burt');
INSERT INTO author(author_id, name_) VALUES (1, 'Carl E. Rasmussen');
INSERT INTO author(author_id, name_) VALUES (2, 'Mark van der Wilk');
INSERT INTO author(author_id, name_) VALUES (3, 'Shlomo Sternberg');
INSERT INTO author(author_id, name_) VALUES (4, 'Lynn Harold Loomis');

------------------------------------ written_by data ------------------------------------
INSERT INTO written_by(author_id, doc_id) VALUES (0, 0);
INSERT INTO written_by(author_id, doc_id) VALUES (1, 0);
INSERT INTO written_by(author_id, doc_id) VALUES (2, 0);
INSERT INTO written_by(author_id, doc_id) VALUES (3, 1);
INSERT INTO written_by(author_id, doc_id) VALUES (4, 1);


------------------------------------ has_reference data ------------------------------------
INSERT INTO has_reference(doc_id, reference) VALUES (0, 1);


------------------------------------ Major data ------------------------------------
INSERT INTO major(majorName) VALUES ('Mathematics');
INSERT INTO major(majorName) VALUES ('Applied Mathematics');
INSERT INTO major(majorName) VALUES ('Computer Science');
INSERT INTO major(majorName) VALUES ('Physics');
INSERT INTO major(majorName) VALUES ('Philosophy');
INSERT INTO major(majorName) VALUES ('History');
INSERT INTO major(majorName) VALUES ('Statistics');

------------------------------------ Is_taught data ------------------------------------
INSERT INTO is_taught(majorName, topic_id) VALUES ('Applied Mathematics', 4);


------------------------------------ has_interest data ------------------------------------
INSERT INTO has_interest(topic_id, usr_id) VALUES (4, 'joel91');


------------------------------------ Recommended data ------------------------------------
INSERT INTO recommended_docs(grade, usr_id, majorName, doc_id) VALUES (3, 'joel91', 'Applied Mathematics', 1);
