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
INSERT INTO usr(usr_id, first_name, email) values ('noe34', 'noe', 'noe.fntn@hotmail.com');
INSERT INTO usr(usr_id, first_name, email) values ('jackie', 'jack', 'ta4L@mycar.com');

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
INSERT INTO document(doc_id, url_, dop, title) values (1, 'http://www.math.harvard.edu/~shlomo/docs/Advanced_Calculus.pdf', TO_DATE('1990', 'yyyy'), 'Advanced Calculus'),
INSERT INTO document(doc_id, url_, dop, title) values (2, 'https://dl.acm.org/citation.cfm?id=861613',TO_DATE(2003, 'YYYY'), 'An Introduction to Database Systems'),
INSERT INTO document(doc_id, url_, dop, title) values (3, 'https://web.stanford.edu/~boyd/cvxbook/bv_cvxbook.pdf',TO_DATE(2013, 'YYYY'), 'Convex Optimization'),
INSERT INTO document(doc_id, url_, dop, title) values (4, 'https://web.stanford.edu/~hastie/Papers/ESLII.pdf',TO_DATE(2001,'YYYY'), 'Elements Of Statistical Learning'),
INSERT INTO document(doc_id, url_, dop, title) values (5, 'https://cds.cern.ch/record/998831/files/9780387310732_TOC.pdf',TO_DATE(2006,'YYYY') 'Pattern Recognition and Machine Learning'),
INSERT INTO document(doc_id, url_, dop, title) values (6, 'https://www.deeplearningbook.org/',TO_DATE(2016,'YYYY'), 'Deep Learning');
INSERT INTO document(doc_id, url_, dop, title) values (7, 'https://chamilo.grenoble-inp.fr/courses/ENSIMAG4MMSADM/document/DigestASM.pdf',TO_DATE(2007,'YYYY'), 'SADM Notes');


------------------------------------ Book data ------------------------------------
INSERT INTO book(doc_id, doi, publisher) values (1, 'https://doi.org/10.1142/9095', 'Jones and Bartlett');
INSERT INTO book(doc_id, doi, publisher) values (2, '0321197844', 'Addison-Wesley');
INSERT INTO book(doc_id, doi, publisher) values (3, '9780511804441', 'Cambridge University Press');
INSERT INTO book(doc_id, doi, publisher) values (4, '978-0-387-84858-7', 'Springer');
INSERT INTO book(doc_id, doi, publisher) values (5, '978-1-4939-3843-8', 'Springer-Verlag');
INSERT INTO book(doc_id, doi, publisher) values (6, '978-2-456-564-3', 'MIT Press');



------------------------------------ Paper data ------------------------------------
INSERT INTO paper(doc_id, journal) values (0, NULL);

------------------------------------ Notes data ------------------------------------
INSERT INTO book(doc_id, course) values (7, 'M1 Statistical Analysis And Document Mining Notes');

------------------------------------ Author data ------------------------------------
INSERT INTO author(author_id, name_) VALUES (0, 'David R. Burt');
INSERT INTO author(author_id, name_) VALUES (1, 'Carl E. Rasmussen');
INSERT INTO author(author_id, name_) VALUES (2, 'Mark van der Wilk');
INSERT INTO author(author_id, name_) VALUES (3, 'Shlomo Sternberg');
INSERT INTO author(author_id, name_) VALUES (4, 'Lynn Harold Loomis');
INSERT INTO author(author_id, name_) VALUES (5, 'Christopher John Date');
INSERT INTO author(author_id, name_) VALUES (6, 'Stephen Boyd');
INSERT INTO author(author_id, name_) VALUES (7, 'Lieven Vandenberghe');
INSERT INTO author(author_id, name_) VALUES (8, 'Trevor Hastie');
INSERT INTO author(author_id, name_) VALUES (9, 'Robert Tibshirani');
INSERT INTO author(author_id, name_) VALUES (10, 'Jerome H. Friedman');
INSERT INTO author(author_id, name_) VALUES (11, 'Christopher Bishop');
INSERT INTO author(author_id, name_) VALUES (12, 'Yoshua Bengio');
INSERT INTO author(author_id, name_) VALUES (13, 'Michael Blum');
INSERT INTO author(author_id, name_) VALUES (14, 'Jean-Baptiste Durand');
INSERT INTO author(author_id, name_) VALUES (15, 'Massih-Reza Amini');

------------------------------------ written_by data ------------------------------------
INSERT INTO written_by(author_id, doc_id) VALUES (0, 0);
INSERT INTO written_by(author_id, doc_id) VALUES (1, 0);
INSERT INTO written_by(author_id, doc_id) VALUES (2, 0);
INSERT INTO written_by(author_id, doc_id) VALUES (3, 1);
INSERT INTO written_by(author_id, doc_id) VALUES (4, 1);
INSERT INTO written_by(author_id, doc_id) VALUES (5, 2);
INSERT INTO written_by(author_id, doc_id) VALUES (6, 3);
INSERT INTO written_by(author_id, doc_id) VALUES (7, 3);
INSERT INTO written_by(author_id, doc_id) VALUES (8, 4);
INSERT INTO written_by(author_id, doc_id) VALUES (9, 4);
INSERT INTO written_by(author_id, doc_id) VALUES (10, 4);
INSERT INTO written_by(author_id, doc_id) VALUES (11, 5);
INSERT INTO written_by(author_id, doc_id) VALUES (12, 6);
INSERT INTO written_by(author_id, doc_id) VALUES (13, 7);
INSERT INTO written_by(author_id, doc_id) VALUES (14, 7);
INSERT INTO written_by(author_id, doc_id) VALUES (15, 7);



------------------------------------ has_reference data ------------------------------------
INSERT INTO has_reference(doc_id, reference) VALUES (0, 1);
INSERT INTO has_reference(doc_id, reference) VALUES (4, 5);
INSERT INTO has_reference(doc_id, reference) VALUES (4, 7);


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
INSERT INTO has_interest(topic_id, usr_id) VALUES (4, 'noe34');


------------------------------------ Recommended data ------------------------------------
INSERT INTO recommended_docs(grade, usr_id, majorName, doc_id) VALUES (3, 'joel91', 'Applied Mathematics', 1);
INSERT INTO recommended_docs(grade, usr_id, majorName, doc_id) VALUES (5, 'noe34', 'Applied Mathematics', 3);
INSERT INTO recommended_docs(grade, usr_id, majorName, doc_id) VALUES (4, 'noe34', 'Applied Mathematics', 4);
INSERT INTO recommended_docs(grade, usr_id, majorName, doc_id) VALUES (5, 'noe34', 'Applied Mathematics', 6);
