DROP TABLE dataBean cascade constraint;

CREATE TABLE DATABEAN (
       ym VARCHAR(200)  NOT NULL,
       areaCode VARCHAR(200) NOT NULL,
       serviceCode VARCHAR(200)NOT NULL,
       people NUMBER NOT NULL,
       sales NUMBER NOT NULL,
       stores NUMBER NOT NULL,
       CONSTRAINT DATABEAN_PK PRIMARY KEY(ym, areaCode, serviceCode)
       );

commit;

insert into databean values('201606', '11949', '가양동', 'CS10009', '중식', 10000, 9096419, 28);
 
insert into databean values('201606', '11949', '가양동', 'CS10006', '일식', 10000, 8276389, 15);
 
insert into databean values('201606', '12000', '목동', 'CS10009', '중식', 15000, 900000, 30);

insert into databean values('201608', '11949', '가양동', 'CS10001', '한식', 10000, 10096419, 40); 

insert into databean values('201606', '12000', '목동', 'CS10001', '한식', 15000, 19096419, 50);
