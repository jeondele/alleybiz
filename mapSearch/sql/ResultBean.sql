DROP TABLE RESULTBEAN cascade constraint;

CREATE TABLE RESULTBEAN (
       areaCode VARCHAR(200) NOT NULL,
       serviceCode VARCHAR(200)NOT NULL,
	   estimatedSales NUMBER NOT NULL,
	   estimatedGroup VARCHAR(200) NOT NULL,
       CONSTRAINT RESULTBEAN_PK  PRIMARY KEY(areaCode, serviceCode)
       );

commit;

insert into RESULTBEAN values('11949', 'CS10009', 890000, '위험' );
insert into RESULTBEAN values('11949', 'CS10006',  8276389, '안전');
insert into RESULTBEAN values('12000',  'CS10009', 900000, '위험');

