drop table usr cascade constraints;
drop table topic cascade constraints;
drop table has_subtopic cascade constraints;
drop table document cascade constraints;
drop table book cascade constraints;
drop table paper cascade constraints;
drop table notes cascade constraints;
drop table author cascade constraints;
drop table has_author cascade constraints;
drop table topic cascade constraints;
drop table major cascade constraints;
drop table is_taught cascade constraints;
drop table has_interest cascade constraints;
drop table recommended_docs cascade constraints;
drop table has_reference cascade constraints;
drop table written_by cascade constraints;


CREATE TABLE usr
(
    usr_id          varchar(16) PRIMARY KEY,
    first_name      varchar(50),
    email           varchar(50)
);

CREATE TABLE topic
(
	topic_id      INT PRIMARY KEY,
    title   varchar(40)
);

CREATE TABLE has_subtopic
(
    -- Key for Child
    child_id            INT,
    -- Foreign Key to Parent
    parent_id           INT,
    foreign key (parent_id) references topic on delete cascade,
    foreign key (child_id) references topic on delete cascade,
    PRIMARY KEY(child_id)
);

CREATE TABLE has_topic
(
	topic_id      INT,
    url_   varchar(250),
    foreign key (topic_id) references topic on delete cascade,
    foreign key (url_) references document on delete cascade,
    PRIMARY KEY(topic_id, url_)
);
--==================== Document and tubtypes ====================
CREATE TABLE document
(
    doc_id          INT PRIMARY KEY,
    url_            varchar(250) UNIQUE,
    dop             DATE NOT NULL,
    title           varchar(150)
);

CREATE TABLE book
(
    doc_id              INT PRIMARY KEY,
    doi                 varchar(250) UNIQUE,
    publisher           varchar(250),
    foreign key (doc_id) references document on delete cascade
);

CREATE TABLE paper
(
    doc_id              INT PRIMARY KEY,
    journal             varchar(150),
    foreign key (doc_id) references document on delete cascade
);

CREATE TABLE notes
(
    doc_id              INT PRIMARY KEY,
    course              varchar(50),
    foreign key (doc_id) references document on delete cascade
);

--=============================================================

--=========================== Author ==========================
CREATE TABLE author
(
    author_id          INT PRIMARY KEY,
    name_              varchar(50)
);

CREATE TABLE written_by
(
    author_id               INT,
    doc_id                  INT,
    PRIMARY KEY(author_id, doc_id),
    foreign key (doc_id) references document on delete cascade,
    foreign key (author_id) references author on delete cascade
);
--=============================================================

--======================= References ==========================
CREATE TABLE has_reference
(
    doc_id              INT,
    reference           INT,
    PRIMARY KEY(doc_id, reference),
    foreign key(doc_id) references document on delete cascade,
    foreign key(reference) references document on delete cascade
);

--=============================================================

--========================= Major ============================

CREATE TABLE major
(
    majorName       VARCHAR(30) PRIMARY KEY
);

CREATE TABLE is_taught
(
    majorName       VARCHAR(30),
    topic_id              INT,
    foreign key (topic_id) references topic on delete cascade,
    foreign key (majorName) references major on delete cascade,
    PRIMARY KEY(majorName, topic_id)
);

CREATE TABLE has_interest
(
    topic_id       INT,
    usr_id        varchar(16),
    foreign key (topic_id) references topic on delete cascade,
    foreign key (usr_id) references usr on delete cascade,
    PRIMARY KEY(topic_id, usr_id)
);

CREATE TABLE recommended_docs
(
    grade           INT,
    usr_id          VARCHAR(16),
    majorName       VARCHAR(50),
    doc_id          INT,
    foreign key (usr_id) references usr on delete cascade,
    foreign key (majorName) references major on delete cascade,
    foreign key (doc_id) references document on delete cascade,
    PRIMARY KEY(usr_id, majorName, doc_id)
);
