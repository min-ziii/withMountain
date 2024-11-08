--테이블 삭제-----------------
DROP TABLE Club;
DROP TABLE Location;

--시퀀스 삭제-----------------
DROP SEQUENCE seqclub;
DROP SEQUENCE seqlocation;

CREATE TABLE Location (
    location_id number PRIMARY KEY,
    name varchar2(30)	NOT NULL
);

CREATE TABLE Club (
	club_id	number	PRIMARY KEY,
	name varchar2(100) NOT NULL,
	is_private	varchar2(10) NOT NULL,
	max_member	number NOT NULL,
    intro	varchar2(600) NOT NULL,
    image	varchar2(300) NOT NULL,
    create_date	date NOT NULL,
    code	varchar2(10) NOT NULL,
        
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);


--시퀀스 생성-----------------
CREATE Sequence seqClub START WITH 1 INCREMENT BY 1;
CREATE Sequence seqLocation START WITH 1 INCREMENT BY 1;
