select * from club;
select * from location;

DELETE FROM Club WHERE club_id = 11;
DELETE FROM Club WHERE club_id = 12;


SELECT * FROM user_sequences WHERE sequence_name = 'SEQCLUB';

CREATE SEQUENCE seqClub
START WITH 11
INCREMENT BY 1
NOCACHE;

drop SEQUENCE seqmember;

CREATE SEQUENCE seqmember
START WITH 31
INCREMENT BY 1
NOCACHE;