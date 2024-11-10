-- 사진첩 아직 어떻게 할지 못정함 -> 테이블만 코스 연결없이 만듦
select * from clubGallery; --41
select * from clubGallery where club_id = 1;

select * from Schedule;
select * from member;

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
	image   varchar2(100)    NOT NULL
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
select * from member;
select * from userinfo;

CREATE SEQUENCE  seqSchedule;
INSERT INTO Schedule(schedule_id, club_id, user_id, course_id, title, hike_date, contents) VALUES(seqSchedule.nextVal, 1, NULL, 1, '북한산 등반', to_date('2024-11-24 14:25', 'yyyy-mm-dd hh24:mi'), '요새 인기있는 코스로 등반해봅시다!');

create or replace view vwClubMemberInfo
as
select c.club_id as club_id, m.member_id as member_id, m.user_id as user_id, m.regdate as regdate, u.name as name, u.profile_image as profile_image
    from club c
        inner join member m
            on c.club_id = m.club_id
                inner join userinfo u
                    on m.user_id = u.user_id;
                    
select m.member_id as member_id, m.club_id as club_id, u.user_id as user_id, m.regdate as regdate, u.name as name
    from member m 
    inner join userInfo u 
    on m.user_id = u.user_id
        where club_id = 1;
    
                        
                        commit;
                        
                        select * from vwclubmemberinfo where club_id = 1;
                        
     
select * from club;
select * from member;
select * from userinfo;

		select c.club_id as club_id,
			m.member_id as member_id,
			m.user_id as user_id,
			m.regdate as regdate,
			u.name as name,
			u.profile_image as profile_image
		from club c
			inner join member m
			on c.club_id = m.club_id
				inner join userinfo u
				on m.user_id = u.user_id
		where c.club_id = 1;
        
		insert into ClubGallery(club_gallery_id, club_id, schedule_id, gallery_date, image)
			values (seqClubGallery.nextVal, 1, null, sysdate, 'memberProfie.jpg');
            
                    select * from (select c.club_id as club_id,
        m.member_id as member_id,
        m.user_id as user_id,
        m.regdate as regdate,
        u.name as name,
        u.profile_image as profile_image
        from club where club_id = 1)  
        inner join member m
        on c.club_id = m.club_id
        inner join userinfo u
        on m.user_id = u.user_id;
 
 
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-01', 'yyyy-mm-dd'), 'club-gallery-image 1.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-04', 'yyyy-mm-dd'), 'club-gallery-image 2.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-04', 'yyyy-mm-dd'), 'club-gallery-image 3.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-08', 'yyyy-mm-dd'), 'club-gallery-image 4.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-16', 'yyyy-mm-dd'), 'club-gallery-image 5.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-16', 'yyyy-mm-dd'), 'club-gallery-image 6.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-16', 'yyyy-mm-dd'), 'club-gallery-image 7.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-17', 'yyyy-mm-dd'), 'club-gallery-image 8.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-21', 'yyyy-mm-dd'), 'club-gallery-image 9.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-25', 'yyyy-mm-dd'), 'club-gallery-image 10.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-10-25', 'yyyy-mm-dd'), 'club-gallery-image 11.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-03', 'yyyy-mm-dd'), 'club-gallery-image 12.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-03', 'yyyy-mm-dd'), 'club-gallery-image 13.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-05', 'yyyy-mm-dd'), 'club-gallery-image 14.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-05', 'yyyy-mm-dd'), 'club-gallery-image 15.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-05', 'yyyy-mm-dd'), 'club-gallery-image 16.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-07', 'yyyy-mm-dd'), 'club-gallery-image 17.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, to_date('2024-11-07', 'yyyy-mm-dd'), 'club-gallery-image 18.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 19.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 20.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 21.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 22.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 23.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 24.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 25.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 26.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 27.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 28.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 29.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 30.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 31.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 32.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 33.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 34.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 35.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 36.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 37.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 38.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 39.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 40.jpg');
INSERT INTO ClubGallery (club_gallery_id, club_id, schedule_id, gallery_date, image) VALUES(seqClubGallery.nextVal, 1, null, sysdate, 'club-gallery-image 41.jpg');

commit;
        