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
drop table recommendedDocs cascade constraints;
drop table has_reference cascade constraints;


CREATE TABLE usr
(
    id              varchar(16) PRIMARY KEY,
    first_name      varchar(50),
    email           varchar(50)
);

CREATE TABLE topic
(
	id      INT PRIMARY KEY,
    title   varchar(40) 
);

CREATE TABLE has_subtopic
(
    -- Key for Child
    id          INT PRIMARY KEY,
    -- Foreign Key to Parent
    parent_id   INT,
    foreign key (parent_id) references topic on delete cascade,
    foreign key (id) references topic on delete cascade,
);

CREATE TABLE has_topic
(
	id      INT,
    url_   varchar(50),
    foreign key (id) references topic on delete cascade,
    foreign key (url_) references document on delete cascade,
    PRIMARY KEY(id, url_)
);
--==================== Document and tubtypes ====================
CREATE TABLE document
(
    url_            varchar(50) PRIMARY KEY,
    dop             DATE NOT NULL,
    title           varchar(50)
);

CREATE TABLE book
(
    url_                varchar(50) PRIMARY KEY,
    doi                 varchar(50) UNIQUE,    
    publisher           varchar(50),
    foreign key (url_) references document on delete cascade
);

CREATE TABLE paper
(
    url_                varchar(50) PRIMARY KEY,
    journal             varchar(50),
    foreign key (url_) references document on delete cascade
);

CREATE TABLE notes  
(
    url_                varchar(50) PRIMARY KEY,
    course              varchar(50),
    foreign key (url_) references document on delete cascade
);

--=============================================================

--=========================== Author ==========================
CREATE TABLE author  
(
    name_              varchar(50),
    dob                DATE,
    PRIMARY KEY(name_, dob)
);

CREATE TABLE written_by  
(
    name_              varchar(50),
    dob                DATE,
    doc_id             varchar(50),     
    PRIMARY KEY(name_, dob, doc_id),
    foreign key (doc_id) references document on delete cascade,
    foreign key (name_, dob) references author on delete cascade
);
--=============================================================

--======================= References ==========================
CREATE TABLE has_reference
(
    url_            varchar(50),
    reference       varchar(50),
    PRIMARY KEY(url_, reference),
    foreign key(url_) references document on delete cascade,
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
    id              INT,
    foreign key (id) references topic on delete cascade,
    foreign key (majorName) references major on delete cascade,
    PRIMARY KEY(majorName, id)
);

CREATE TABLE has_interest
(
    topicId       VARCHAR(30),
    userId        INT,
    foreign key (topicId) references topic on delete cascade,
    foreign key (userId) references usr on delete cascade,
    PRIMARY KEY(topicId, userId) 
);

CREATE TABLE recommendedDocs 
(
    grade           INT,
    userName        VARCHAR(50),
    majorName       VARCHAR(50),
    url_            varchar(50),
    foreign key (userName) references usr on delete cascade,
    foreign key (majorName) references major on delete cascade,
    foreign key (url_) references document on delete cascade,
    PRIMARY KEY(userName, majorName, url_) 
);
