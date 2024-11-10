-- 사진첩 아직 어떻게 할지 못정함 -> 테이블만 코스 연결없이 만듦
select * from clubGallery;
select * from clubGallery where club_id = 1;

select * from Schedule;

drop table ClubGallery;

CREATE TABLE ClubGallery (
	club_gallery_id	number	NOT NULL,
	club_id	number	NOT NULL,
    club_mt_name varchar2(100) NOT NULL,
	gallery_date	date	NOT NULL,
	image   varchar2(100)    NOT NULL
);

CREATE TABLE ClubGallery (
	club_gallery_id	number	NOT NULL,
	club_id	number	NOT NULL,
	schedule_id	number	NULL,
	gallery_date	date	NOT NULL,
	image   varchar2(50)    NOT NULL
);

ALTER TABLE ClubGallery ADD CONSTRAINT PK_CLUBGALLERY PRIMARY KEY (
	club_gallery_id
);

ALTER TABLE ClubGallery ADD CONSTRAINT FK_CLUBGALLERY_CLUB FOREIGN KEY (club_id) REFERENCES Club(club_id);
ALTER TABLE ClubGallery ADD CONSTRAINT FK_CLUBGALLERY_SCHEDULE FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id);

ALTER TABLE ClubGallery ADD CONSTRAINT FK_CLUBGALLERY_CLUB FOREIGN KEY (club_id) REFERENCES Club(club_id);

CREATE SEQUENCE  seqClubGallery ;
DROP SEQUENCE seqClubGallery ;

insert into ClubGallery(club_gallery_id, club_id, schedule_id, gallery_date, image) values (seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image2');
insert into ClubGallery(club_gallery_id, club_id, schedule_id, gallery_date, image) values (seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image3');
commit;

select * from course;

select * from club;

CREATE SEQUENCE  seqSchedule;
INSERT INTO Schedule(schedule_id, club_id, user_id, course_id, title, hike_date, contents) VALUES(seqSchedule.nextVal, 1, NULL, 1, '북한산 등반', to_date('2024-11-24 14:25', 'yyyy-mm-dd hh24:mi'), '요새 인기있는 코스로 등반해봅시다!');