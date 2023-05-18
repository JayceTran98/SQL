--1.In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
select b.mahv,b.ho,b.ten,b.ngsinh,b.malop
from lop a left join hocvien b on a.trglop = b.mahv

--2.In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
select a.mahv,a.ho,a.ten,b.lt,b.diem
from hocvien a left join ketquathi b on a.mahv = b.mahv
where a.malop = 'k12' and b.mamh = 'CTRR'
order by a.ten,a.ho

--3.In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
select a.mahv,a.ho,a.ten,b.mamh
from hocvien a left join ketquathi b on a.mahv = b.mahv
where lt = 1 and kqua = 'dat'

--4.In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
select a.mahv,a.ho,a.ten
from hocvien a left join ketquathi b on a.mahv = b.mahv
where a.malop = 'k11' and b.mamh='CTRR' and lt = 1 and b.kqua ='khong dat'

--5.* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
select a.mahv,a.ho,a.ten
from hocvien a left join ketquathi b on a.mahv = b.mahv
where a.malop like 'k%' and b.mamh ='CTRR' and b.kqua ='khong dat'

--6.Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
select c.tenmh
from giaovien a inner join giangday b on a.magv = b.magv
inner join monhoc c on b.mamh = c.mamh 
where a.hoten = 'Tran Tam Thanh' and b.hocky = 1 and nam = 2006

--7.Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
select a.mamh,a.tenmh
from monhoc a inner join giangday b on a.mamh = b.mamh
inner join lop c on b.magv = c.magvcn
where b.malop = 'k11' and b.hocky = 1 and nam = 2006

--8.Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
select a.ho,a.ten
from hocvien a inner join lop b on a.mahv = b.trglop
inner join giangday c on b.malop = c.malop
inner join giaovien d on c.magv =d.magv
inner join monhoc e on c.mamh = e.mamh
where d.hoten = 'Nguyen To Lan' and e.tenmh = 'Co So Du Lieu'

--9.In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
select a.mamh,a.tenmh
from MONHOC a inner join DIEUKIEN b on a.MAMH =b.MAMH_TRUOC
where b.MAMH ='CSDL'

--10.Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
select a.mamh,a.tenmh
from MONHOC a inner join DIEUKIEN b on a.MAMH =b.MAMH
where b.MAMH_TRUOC ='CTRR'

--11.Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
select a.hoten
from giaovien a inner join giangday b on a.magv = b.magv
where b.malop = 'k11' and b.hocky = 1 and nam = 2006 and b.mamh = 'CTRR'
intersect
select a.hoten
from giaovien a inner join giangday b on a.magv = b.magv
where b.malop = 'k12' and b.hocky = 1 and nam = 2006 and b.mamh = 'CTRR'

--12.Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
 with count_lt as (
 select mahv,count(mahv) as count_lt 
			from ketquathi 
			where (mamh ='CSDL' and kqua ='khong dat')  
			group by mahv 
			having count(mahv) =1
			)
select a.mahv,a.ho,a.ten
from hocvien a inner join count_lt b on a.mahv = b.mahv

--13.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
select a.magv,a.hoten
from giaovien a
where a.magv not in (select magv from giangday)

--14.Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.

--15.Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
select a.ho,a.TEN
from HOCVIEN a inner join KETQUATHI b on a.MAHV = b.MAHV
where (a.MALOP = 'k11' and b.LT >= 3 and b.KQUA = 'khong dat') or (b.LT = 2 and b.MAMH = 'CTRR' and b.DIEM = 5)

--16.Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
with count_class as (
select MAGV,count(malop) as count_class
from GIANGDAY
where MAMH = 'CTRR' and HOCKY = 1
group by MAGV
having count(malop) >= 2
union
select MAGV,count(malop) as count_class
from GIANGDAY
where MAMH = 'CTRR' and HOCKY = 2
group by MAGV
having count(malop) >= 2
union
select MAGV,count(malop) as count_class
from GIANGDAY
where MAMH = 'CTRR' and HOCKY = 3
group by MAGV
having count(malop) >= 2
)

select a.MAGV,a.HOTEN
from GIAOVIEN a inner join count_class b on a.MAGV = b.MAGV

--17.Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
with diem_thi as(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY mahv ORDER BY ngthi DESC) AS rn
    FROM KETQUATHI
	WHERE mamh = 'CSDL')

select a.ho,a.TEN,b.DIEM
from HOCVIEN a inner join diem_thi b on a.MAHV = b.MAHV
where rn = 1

--18.Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
with diem_thi as(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY mahv ORDER BY diem DESC) AS rn
    FROM KETQUATHI
	WHERE mamh = 'CSDL')

select a.ho,a.TEN,b.DIEM
from HOCVIEN a inner join diem_thi b on a.MAHV = b.MAHV
where rn = 1

--19.	Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
select MAKHOA,TENKHOA
from khoa
where NGTLAP <= (select min(NGTLAP) from KHOA)

--20.	Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
select HOCHAM,count(hocham) as num
from GIAOVIEN
group by HOCHAM
having HOCHAM ='GS' or HOCHAM = 'PGS'

--21.Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
select hocvi,count(hocvi),makhoa
from giaovien
group by makhoa,hocvi

--22.Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
select mamh,kqua,count(kqua)as [count] 
from ketquathi
group by mamh,kqua

--23.Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
select a.magv,a.hoten
from giaovien a inner join lop b on a.magv = b.magvcn
inner join giangday c on b.magvcn = c.magv
where c.malop = b.malop

--24.Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
select b.ho,b.ten
from lop a inner join hocvien b on a.trglop = b.mahv
where a.siso >= (select max(siso) from lop)


--25.* Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
select c.ho,c.ten
from lop a inner join ketquathi b on a.trglop = b.mahv
inner join hocvien c on c.mahv = b.mahv
where b.kqua = 'khong dat'

--26.Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
select b.mahv,a.ho,a.ten,b.diem,count(diem)
from hocvien a inner join ketquathi b on a.mahv = b.mahv
group by b.mahv,a.ho,a.ten,b.diem
having (b.diem between 9 and 10) and count(diem) >= 2

--27.Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
select b.mahv,a.ho,a.ten,b.diem,a.MALOP,count(diem)
from hocvien a inner join ketquathi b on a.mahv = b.mahv
group by b.mahv,a.ho,a.ten,b.diem,a.MALOP
having (b.diem between 9 and 10) and count(diem) >= 2

--28.Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
select MAGV,HOCKY,count(mamh) as Sl_MH, count(malop) as sl_lop
from GIANGDAY
group by MAGV,HOCKY
--29.Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
select a.MAGV,b.HOTEN,a.HOCKY,count(a.mamh) as Sl_MH
from GIANGDAY a inner join GIAOVIEN b on a.MAGV = b.MAGV
group by a.MAGV,a.HOCKY,b.HOTEN
having count(a.mamh) >= 2
--30.Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
with SL as (
select b.MAMH,a.TENMH,count(b.kqua) as num
from MONHOC a inner join KETQUATHI b on a.MAMH = b.MAMH
where b.lt =1 and b.KQUA = 'khong dat'
group by b.MAMH,a.TENMH
)
select mamh,tenmh
from SL
where num >= (select max(num) from sl)

