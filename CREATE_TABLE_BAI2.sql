﻿--KHOA
CREATE TABLE KHOA(
   MAKHOA  VARCHAR(4) NOT NULL PRIMARY KEY
  ,TENKHOA VARCHAR(40) 
  ,NGTLAP  SMALLDATETIME  
  ,TRGKHOA CHAR(4)
);
INSERT INTO KHOA(MAKHOA,TENKHOA,NGTLAP,TRGKHOA) VALUES ('KHMT','Khoa hoc may tinh','2005/06/07','GV01');
INSERT INTO KHOA(MAKHOA,TENKHOA,NGTLAP,TRGKHOA) VALUES ('HTTT','He thong thong tin','2005/06/07','GV02');
INSERT INTO KHOA(MAKHOA,TENKHOA,NGTLAP,TRGKHOA) VALUES ('CNPM','Cong nghe phan mem','2005/06/07','GV04');
INSERT INTO KHOA(MAKHOA,TENKHOA,NGTLAP,TRGKHOA) VALUES ('MTT','Mang va truyen thong','2005/10/20','GV03');
INSERT INTO KHOA(MAKHOA,TENKHOA,NGTLAP,TRGKHOA) VALUES ('KTMT','Ky thuat may tinh','2005/12/20',NULL);

--MON HOC
CREATE TABLE MONHOC(
   MAMH   VARCHAR(10) NOT NULL PRIMARY KEY
  ,TENMH  VARCHAR(40) 
  ,TCLT   tinyint  
  ,TCTH   tinyint  
  ,MAKHOA VARCHAR(4) 
);
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('THDC','Tin hoc dai cuong',4,1,'KHMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('CTRR','Cau truc roi rac',5,0,'KHMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('CSDL','Co so du lieu',3,1,'HTTT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('DHMT','Do hoa may tinh',3,1,'KHMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('KTMT','Kien truc may tinh',3,0,'KTMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('HDH','He dieu hanh',4,0,'KTMT');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('LTCFW','Lap trinh C for win',3,1,'CNPM');
INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES ('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM');

--DIEUKIEN
CREATE TABLE DIEUKIEN(
   MAMH       VARCHAR(10)
  ,MAMH_TRUOC VARCHAR(10)
);
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('CSDL','CTRR');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('CSDL','CTDLGT');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('CTDLGT','THDC');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('PTTKTT','THDC');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('PTTKTT','CTDLGT');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('DHMT','THDC');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('LTHDT','THDC');
INSERT INTO DIEUKIEN(MAMH,MAMH_TRUOC) VALUES ('PTTKHTTT','CSDL');

--GIAO VIEN
CREATE TABLE GIAOVIEN(
   MAGV     CHAR(4) NOT NULL PRIMARY KEY
  ,HOTEN    VARCHAR(40) 
  ,HOCVI    VARCHAR(10) 
  ,HOCHAM   VARCHAR(10)
  ,GIOITINH VARCHAR(3) 
  ,NGSINH   smalldatetime  
  ,NGVL     smalldatetime  
  ,HESO     NUMERIC(4,2)
  ,MUCLUONG MONEY 
  ,MAKHOA   VARCHAR(4) 
);
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV01','Ho Thanh Son','PTS','GS','Nam','1950/05/02','2004/01/11',5.00,'2,250,000','KHMT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV02','Tran Tam Thanh','TS','PGS','Nam','1965/12/17','2004/04/20',4.50,'2,025,000','HTTT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV03','Do Nghiem Phung','TS','GS','Nu','1950/08/01','2004/09/23',4.00,'1,800,000','CNPM');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV04','Tran Nam Son','TS','PGS','Nam','1961/02/22','2005/01/12',4.50,'2,025,000','KTMT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV05','Mai Thanh Danh','ThS','GV','Nam','1958/03/12','2005/01/12',3.00,'1,350,000','HTTT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV06','Tran Doan Hung','TS','GV','Nam','1953/03/11','2005/01/12',4.50,'2,025,000','KHMT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV07','Nguyen Minh Tien','ThS','GV','Nam','1971/11/23','2005/03/01',4.00,'1,800,000','KHMT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV08','Le Thi Tran','KS',NULL,'Nu','1974/03/26','2005/03/01',1.69,'760,500','KHMT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV09','Nguyen To Lan','ThS','GV','Nu','1966/12/31','2005/03/01',4.00,'1,800,000','HTTT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV10','Le Tran Anh Loan','KS',NULL,'Nu','1972/07/17','2005/03/01',1.86,'837,000','CNPM');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV11','Ho Thanh Tung','CN','GV','Nam','1980/01/12','2005/05/15',2.67,'1,201,500','MTT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV12','Tran Van Anh','CN',NULL,'Nu','1981/03/29','2005/05/15',1.69,'760,500','CNPM');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV13','Nguyen Linh Dan','CN',NULL,'Nu','1980/05/23','2005/05/15',1.69,'760,500','KTMT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV14','Truong Minh Chau','ThS','GV','Nu','1976/11/30','2005/05/15',3.00,'1,350,000','MTT');
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES ('GV15','Le Ha Thanh','ThS','GV','Nam','1978/05/04','2005/05/15',3.00,'1,350,000','KHMT');

--LOP
CREATE TABLE LOP(
   MALOP  CHAR(3) NOT NULL PRIMARY KEY
  ,TENLOP VARCHAR(40) 
  ,TRGLOP CHAR(5) 
  ,SISO   tinyint  
  ,MAGVCN CHAR(4) 
);
INSERT INTO LOP(MALOP,TENLOP,TRGLOP,SISO,MAGVCN) VALUES ('K11','Lop 1 khoa 1','K1108',11,'GV07');
INSERT INTO LOP(MALOP,TENLOP,TRGLOP,SISO,MAGVCN) VALUES ('K12','Lop 2 khoa 1','K1205',12,'GV09');
INSERT INTO LOP(MALOP,TENLOP,TRGLOP,SISO,MAGVCN) VALUES ('K13','Lop 3 khoa 1','K1305',12,'GV14');

--HOC VIEN
CREATE TABLE HOCVIEN(
   MAHV     CHAR(5) NOT NULL PRIMARY KEY
  ,HO       VARCHAR(40) 
  ,TEN      VARCHAR(10) 
  ,NGSINH   smalldatetime  
  ,GIOITINH VARCHAR(3) 
  ,NOISINH  VARCHAR(40) 
  ,MALOP    CHAR(3) 
);
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1101','Nguyen Van','A','1986/01/27','Nam','TpHCM','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1102','Tran Ngoc','Han','1986/03/14','Nu','Kien Giang','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1103','Ha Duy','Lap','1986/04/18','Nam','Nghe An','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1104','Tran Ngoc','Linh','1986/03/30','Nu','Tay Ninh','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1105','Tran Minh','Long','1986/02/27','Nam','TpHCM','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1106','Le Nhat','Minh','1986/01/24','Nam','TpHCM','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1107','Nguyen Nhu','Nhut','1986/01/27','Nam','Ha Noi','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1108','Nguyen Manh','Tam','1986/02/27','Nam','Kien Giang','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1109','Phan Thi Thanh','Tam','1986/01/27','Nu','Vinh Long','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1110','Le Hoai','Thuong','1986/02/05','Nu','Can Tho','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1111','Le Ha','Vinh','1986/12/25','Nam','Vinh Long','K11');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1201','Nguyen Van','B','1986/02/11','Nam','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1202','Nguyen Thi Kim','Duyen','1986/01/18','Nu','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1203','Tran Thi Kim','Duyen','1986/09/17','Nu','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1204','Truong My','Hanh','1986/05/19','Nu','Dong Nai','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1205','Nguyen Thanh','Nam','1986/04/17','Nam','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1206','Nguyen Thi Truc','Thanh','1986/03/04','Nu','Kien Giang','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1207','Tran Thi Bich','Thuy','1986/02/08','Nu','Nghe An','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1208','Huynh Thi Kim','Trieu','1986/04/08','Nu','Tay Ninh','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1209','Pham Thanh','Trieu','1986/02/23','Nam','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1210','Ngo Thanh','Tuan','1986/02/14','Nam','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1211','Do Thi','Xuan','1986/03/09','Nu','Ha Noi','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1212','Le Thi Phi','Yen','1986/03/12','Nu','TpHCM','K12');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1301','Nguyen Thi Kim','Cuc','1986/06/09','Nu','Kien Giang','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1302','Truong Thi My','Hien','1986/03/18','Nu','Nghe An','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1303','Le Duc','Hien','1986/03/21','Nam','Tay Ninh','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1304','Le Quang','Hien','1986/04/18','Nam','TpHCM','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1305','Le Thi','Huong','1986/03/27','Nu','TpHCM','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1306','Nguyen Thai','Huu','1986/03/30','Nam','Ha Noi','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1307','Tran Minh','Man','1986/05/28','Nam','TpHCM','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1308','Nguyen Hieu','Nghia','1986/04/08','Nam','Kien Giang','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1309','Nguyen Trung','Nghia','1987/01/18','Nam','Nghe An','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1310','Tran Thi Hong','Tham','1986/04/22','Nu','Tay Ninh','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1311','Tran Minh','Thuc','1986/04/04','Nam','TpHCM','K13');
INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES ('K1312','Nguyen Thi Kim','Yen','1986/09/07','Nu','TpHCM','K13');

--GIANG DAY
CREATE TABLE GIANGDAY(
   MALOP   CHAR(3) 
  ,MAMH    VARCHAR(10)
  ,MAGV    CHAR(4) 
  ,HOCKY   tinyint  
  ,NAM     smallint  
  ,TUNGAY  smalldatetime
  ,DENNGAY smalldatetime
);
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K11','THDC','GV07',1,2006,'2006/01/02','2006/05/12');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K12','THDC','GV06',1,2006,'2006/01/02','2006/05/12');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K13','THDC','GV15',1,2006,'2006/01/02','2006/05/12');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K11','CTRR','GV02',1,2006,'2006/01/09','2006/05/17');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K12','CTRR','GV02',1,2006,'2006/01/09','2006/05/17');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K13','CTRR','GV08',1,2006,'2006/01/09','2006/05/17');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K11','CSDL','GV05',2,2006,'2006/06/01','2006/07/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K12','CSDL','GV09',2,2006,'2006/06/01','2006/07/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K13','CTDLGT','GV15',2,2006,'2006/06/01','2006/07/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K13','CSDL','GV05',3,2006,'2006/08/01','2006/12/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K13','DHMT','GV07',3,2006,'2006/08/01','2006/12/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K11','CTDLGT','GV15',3,2006,'2006/08/01','2006/12/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K12','CTDLGT','GV15',3,2006,'2006/08/01','2006/12/15');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K11','HDH','GV04',1,2007,'2007/01/02','2007/02/18');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K12','HDH','GV04',1,2007,'2007/01/02','2007/03/20');
INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES ('K11','DHMT','GV07',1,2007,'2007/02/18','2007/03/20');

--KET QUA THI
CREATE TABLE KETQUATHI(
   MAHV  CHAR(5) 
  ,MAMH  VARCHAR(10) 
  ,LT    tinyint  
  ,NGTHI smalldatetime  
  ,DIEM  NUMERIC(4,2) 
  ,KQUA  VARCHAR(10) 
);
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1101','CSDL',1,'2006/07/20',10.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1101','CTDLGT',1,'2006/12/28',9.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1101','THDC',1,'2006/05/20',9.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1101','CTRR',1,'2006/05/13',9.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CSDL',1,'2006/07/20',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CSDL',2,'2006/07/27',4.25,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CSDL',3,'2006/08/10',4.50,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CTDLGT',1,'2006/12/28',4.50,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CTDLGT',2,'2007/01/05',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CTDLGT',3,'2007/01/15',6.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','THDC',1,'2006/05/20',5.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1102','CTRR',1,'2006/05/13',7.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1103','CSDL',1,'2006/07/20',3.50,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1103','CSDL',2,'2006/07/27',8.25,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1103','CTDLGT',1,'2006/12/28',7.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1103','THDC',1,'2006/05/20',8.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1103','CTRR',1,'2006/05/13',6.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1104','CSDL',1,'2006/07/20',3.75,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1104','CTDLGT',1,'2006/12/28',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1104','THDC',1,'2006/05/20',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1104','CTRR',1,'2006/05/13',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1104','CTRR',2,'2006/05/20',3.50,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1104','CTRR',3,'2006/06/30',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1201','CSDL',1,'2006/07/20',6.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1201','CTDLGT',1,'2006/12/28',5.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1201','THDC',1,'2006/05/20',8.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1201','CTRR',1,'2006/05/13',9.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','CSDL',1,'2006/07/20',8.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','CTDLGT',1,'2006/12/28',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','CTDLGT',2,'2007/01/05',5.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','THDC',1,'2006/05/20',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','THDC',2,'2006/05/27',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','CTRR',1,'2006/05/13',3.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','CTRR',2,'2006/05/20',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1202','CTRR',3,'2006/06/30',6.25,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1203','CSDL',1,'2006/07/20',9.25,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1203','CTDLGT',1,'2006/12/28',9.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1203','THDC',1,'2006/05/20',10.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1203','CTRR',1,'2006/05/13',10.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1204','CSDL',1,'2006/07/20',8.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1204','CTDLGT',1,'2006/12/28',6.75,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1204','THDC',1,'2006/05/20',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1204','CTRR',1,'2006/05/13',6.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1301','CSDL',1,'2006/12/20',4.25,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1301','CTDLGT',1,'2006/07/25',8.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1301','THDC',1,'2006/05/20',7.75,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1301','CTRR',1,'2006/05/13',8.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1302','CSDL',1,'2006/12/20',6.75,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1302','CTDLGT',1,'2006/07/25',5.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1302','THDC',1,'2006/05/20',8.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1302','CTRR',1,'2006/05/13',8.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','CSDL',1,'2006/12/20',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','CTDLGT',1,'2006/07/25',4.50,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','CTDLGT',2,'2006/08/07',4.00,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','CTDLGT',3,'2006/08/15',4.25,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','THDC',1,'2006/05/20',4.50,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','CTRR',1,'2006/05/13',3.25,'Khong Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1303','CTRR',2,'2006/05/20',5.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1304','CSDL',1,'2006/12/20',7.75,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1304','CTDLGT',1,'2006/07/25',9.75,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1304','THDC',1,'2006/05/20',5.50,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1304','CTRR',1,'2006/05/13',5.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1305','CSDL',1,'2006/12/20',9.25,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1305','CTDLGT',1,'2006/07/25',10.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1305','THDC',1,'2006/05/20',8.00,'Dat');
INSERT INTO KETQUATHI(MAHV,MAMH,LT,NGTHI,DIEM,KQUA) VALUES ('K1305','CTRR',1,'2006/05/13',10.00,'Dat');

--TẠO KHOÁ PHỤ(FOREIGN KEY)
ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV);
ALTER TABLE MONHOC ADD CONSTRAINT FK_MH FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA);
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DK1 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DK2 FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH);
ALTER TABLE LOP ADD CONSTRAINT FK_LOP1 FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV);
ALTER TABLE LOP ADD CONSTRAINT FK_LOP2 FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV);
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD1 FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD2 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD3 FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQT1 FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV);
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQT2 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);