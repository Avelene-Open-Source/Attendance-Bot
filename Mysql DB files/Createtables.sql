create database IF NOT EXISTS uniDb;
use uniDb;

# Stduent Detail tables

CREATE TABLE ce_students ( 
	srn                  char(8)  NOT NULL  ,
	name                varchar(40)  NOT NULL  ,
	semester            tinyint  NOT NULL  ,
	section              char(1)  NOT NULL  ,
	branch               char(2)  NOT NULL DEFAULT "CE" ,
    CHECK (semester<9 AND semester>0),
	CONSTRAINT pk_cse_stduents_srn_3 PRIMARY KEY ( srn )
 );

CREATE TABLE cse_students ( 
	srn                  char(8)  NOT NULL  ,
	name                 varchar(40)  NOT NULL  ,
	semester             tinyint  NOT NULL  ,
	section              char(1)  NOT NULL  ,
	branch               char(3)  NOT NULL DEFAULT "CSE" ,
    CHECK (semester<9 AND semester>0),
	CONSTRAINT pk_cse_stduents_srn PRIMARY KEY ( srn )
 );

CREATE TABLE ece_students ( 
	srn                  char(8)  NOT NULL  ,
	name                 varchar(40)  NOT NULL  ,
	semester             tinyint  NULL  ,
	section              char(1)  NOT NULL  ,
	branch               char(3)  NOT NULL DEFAULT "ECE" ,
    CHECK (semester<9 AND semester>0),
	CONSTRAINT pk_cse_stduents_srn_0 PRIMARY KEY ( srn )
 );

CREATE TABLE eee_students ( 
	srn                  char(8)  NOT NULL  ,
	name                 varchar(40)  NOT NULL  ,
	semester             tinyint  NOT NULL  ,
	section              char(1)  NOT NULL  ,
	branch               char(3)  NOT NULL DEFAULT "EEE" ,
    CHECK (semester<9 AND semester>0),
	CONSTRAINT pk_cse_stduents_srn_2 PRIMARY KEY ( srn )
 );

CREATE TABLE me_students ( 
	srn                  char(8)  NOT NULL  ,
	name                 varchar(40)  NOT NULL  ,
	semester             tinyint  NOT NULL  ,
	section              char(1)  NOT NULL  ,
	branch               char(2)  NOT NULL DEFAULT "ME" ,
    CHECK (semester<9 AND semester>0),
	CONSTRAINT pk_cse_stduents_srn_1 PRIMARY KEY ( srn )
 );

# Stduent Attendance tables

CREATE TABLE ce_attendance ( 
	srn                  char(8) UNIQUE NOT NULL ,
	days_attended        smallint UNSIGNED NOT NULL DEFAULT 0 ,
	days_total           smallint UNSIGNED NOT NULL  ,
	percentage FLOAT AS ((days_attended/days_total)*100) STORED,
	CONSTRAINT fk_cv_attendance FOREIGN KEY ( srn ) REFERENCES ce_students( srn ) ON DELETE CASCADE
 );

 
CREATE TABLE me_attendance ( 
	srn                  char(8) UNIQUE NOT NULL ,
	days_attended        smallint UNSIGNED NOT NULL DEFAULT 0 ,
	days_total           smallint UNSIGNED NOT NULL  ,
	percentage FLOAT AS ((days_attended/days_total)*100) STORED,
	CONSTRAINT fk_me_attendance FOREIGN KEY ( srn ) REFERENCES me_students( srn ) ON DELETE CASCADE
 );

 CREATE TABLE cse_attendance ( 
	srn                  char(8) UNIQUE NOT NULL ,
	days_attended        smallint UNSIGNED NOT NULL DEFAULT 0 ,
	days_total           smallint UNSIGNED NOT NULL  ,
	percentage FLOAT AS ((days_attended/days_total)*100) STORED,
	CONSTRAINT fk_cse_attendance FOREIGN KEY ( srn ) REFERENCES cse_students( srn ) ON DELETE CASCADE
 );


 CREATE TABLE ece_attendance ( 
	srn                  char(8) UNIQUE NOT NULL  ,
	days_attended        smallint UNSIGNED NOT NULL DEFAULT 0 ,
	days_total           smallint UNSIGNED NOT NULL ,
	percentage FLOAT AS ((days_attended/days_total)*100) STORED,
	CONSTRAINT fk_ece_attendance FOREIGN KEY ( srn ) REFERENCES ece_students( srn ) ON DELETE CASCADE
 );

 CREATE TABLE eee_attendance ( 
	srn                  char(8) UNIQUE NOT NULL  ,
	days_attended        smallint UNSIGNED NOT NULL DEFAULT 0 ,
	days_total           smallint UNSIGNED NOT NULL  ,
	percentage FLOAT AS ((days_attended/days_total)*100) STORED,
	CONSTRAINT fk_eee_attendance FOREIGN KEY ( srn ) REFERENCES eee_students( srn ) ON DELETE CASCADE
 );


# Complaint Tables
CREATE TABLE cse_complaints ( 
	id                   char(4)  NOT NULL  ,
	srn                  char(8)  NOT NULL  ,
	complaint            varchar(1000)  NOT NULL  ,
	status               enum("Resolved","Unresolved")  NOT NULL DEFAULT "Unresolved" ,
	CONSTRAINT pk_complaints_id PRIMARY KEY ( id ),
	CONSTRAINT fk_cse_complaints FOREIGN KEY ( srn ) REFERENCES cse_students( srn ) ON DELETE CASCADE
 );

CREATE TABLE ece_complaints ( 
	id                   char(4)  NOT NULL  ,
	srn                  char(8)  NOT NULL  ,
	complaint            varchar(1000)  NOT NULL  ,
	status               enum("Resolved","Unresolved")  NOT NULL DEFAULT "Unresolved" ,
	CONSTRAINT pk_complaints_id_1 PRIMARY KEY ( id ),
	CONSTRAINT fk_ece_complaints FOREIGN KEY ( srn ) REFERENCES ece_students( srn ) ON DELETE CASCADE
 );


CREATE TABLE eee_complaints ( 
	id                   char(4)  NOT NULL  ,
	srn                  char(8)  NOT NULL  ,
	complaint            varchar(1000)  NOT NULL  ,
	status               enum("Resolved","Unresolved")  NOT NULL DEFAULT "Unresolved" ,
	CONSTRAINT pk_complaints_id_3 PRIMARY KEY ( id ),
	CONSTRAINT fk_eee_complaints FOREIGN KEY ( srn ) REFERENCES eee_students( srn ) ON DELETE CASCADE
 );


CREATE TABLE me_complaints ( 
	id                   char(4)  NOT NULL  ,
	srn                  char(8)  NOT NULL  ,
	complaint            varchar(1000)  NOT NULL  ,
	status               enum("Resolved","Unresolved")  NOT NULL DEFAULT "Unresolved" ,
	CONSTRAINT pk_complaints_id_2 PRIMARY KEY ( id ),
	CONSTRAINT fk_me_complaints FOREIGN KEY ( srn ) REFERENCES me_students( srn ) ON DELETE CASCADE
 );

 CREATE TABLE ce_complaints ( 
	id                   char(4)  NOT NULL  ,
	srn                  char(8)  NOT NULL  ,
	complaint            varchar(1000)  NOT NULL  ,
	status               enum("Resolved","Unresolved")  NOT NULL DEFAULT "Unresolved" ,
	CONSTRAINT pk_complaints_id_0 PRIMARY KEY ( id ),
	CONSTRAINT fk_ce_complaints FOREIGN KEY ( srn ) REFERENCES ce_students( srn ) ON DELETE CASCADE
 );


#Latest Updates
CREATE TABLE latest_update ( 
	sl_no                int UNSIGNED NOT NULL  AUTO_INCREMENT,
	content              varchar(250)  NOT NULL  ,
	branch               enum("UNI","CSE","ME","CE","ECE","EEE")  NOT NULL DEFAULT "UNI" ,
	date_issued          DATE NOT NULL ,
	expiry               datetime  NOT NULL  ,
	CHECK (DATE(expiry)>date_issued),
	CONSTRAINT pk_latest_update_sl_no PRIMARY KEY ( sl_no )
 );