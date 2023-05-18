-- 1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất. --
SELECT MASP , TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

--2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
select masp,tensp
from sanpham
where dvt in('cay','quyen')

--3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
select masp,tensp
from sanpham
where masp like 'B%01' 

--4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
select masp,tensp
from sanpham
where nuocsx = 'Trung Quoc' and gia between 30000 and 40000

--5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
select masp,tensp
from sanpham
where nuocsx in('Trung Quoc','Thai Lan') and gia between 30000 and 40000

--6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select sohd,trigia,nghd
from hoadon
where nghd in ('1/1/2007','2/1/2007')

--7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select sohd,trigia,nghd
from hoadon
where month(nghd) = 1
order by nghd , trigia desc

--8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select a.makh,a.hoten
from khachhang a left join hoadon b on a.makh = b.makh
where b.nghd = '1/1/2007'

--9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.--
select a.hoten,b.sohd,b.trigia,b.nghd
from nhanvien a left join hoadon b on a.manv = b.manv
where a.hoten = 'Nguyen Van B' and b.nghd = '2006/10/28'


--10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.--
select a.masp,a.tensp , d.hoten, c.nghd
from sanpham a left join cthd b on a.masp = b.masp
left join hoadon c on b.sohd = c.sohd
inner join khachhang d on c.makh = d.makh
where d.hoten = 'Nguyen Van A' and month(c.nghd) = 10 and year(c.nghd) = 2006

--11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select distinct a.sohd
from hoadon a left join cthd b on a.sohd = b.sohd
where b.masp in('BB01','BB02')

--12.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select distinct a.sohd
from hoadon a left join cthd b on a.sohd = b.sohd
where b.masp in('BB01','BB02') and b.sl between 10 and 20

--13.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select a.sohd
from hoadon a left join cthd b on a.sohd = b.sohd
where b.masp ='BB01' and b.sl between 10 and 20
intersect
select a.sohd
from hoadon a left join cthd b on a.sohd = b.sohd
where b.masp ='BB02' and b.sl between 10 and 20

--14.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT a.MASP , a.TENSP
FROM SANPHAM a left join cthd b on a.masp = b.masp
right join hoadon c on b.sohd = c.sohd 
WHERE NUOCSX = 'Trung Quoc' or c.nghd = '2007/1/1'

--15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select a.masp, a.tensp
from sanpham a
where masp not in (select masp from cthd)

--16.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
with unsold as(
	select a.sohd, b.masp
	from hoadon a left join cthd b on a.sohd = b.sohd
	where year(a.nghd) != 2006
	)
select a.masp, a.tensp
from sanpham a inner join unsold b on a.masp = b.masp

--17.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
with unsold as(
	select a.sohd, b.masp
	from hoadon a left join cthd b on a.sohd = b.sohd
	where year(a.nghd) != 2006
	)
select a.masp, a.tensp
from sanpham a inner join unsold b on a.masp = b.masp
where a.nuocsx ='Trung Quoc'
--18.	Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
with Bill as(
	select a.sohd, b.masp
	from hoadon a inner join cthd b on a.sohd = b.sohd
	)
select a.sohd
from Bill a left join sanpham b on a.masp = b.masp
where b.nuocsx = 'Singapore'
--19.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
with bill as(
	select a.sohd, b.masp
	from hoadon a left join cthd b on a.sohd = b.sohd
	where year(a.nghd) = 2006
	)
select distinct a.sohd
from bill a inner join sanpham b on a.masp = b.masp
where b.nuocsx ='Singapore'

--20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count(sohd)
from HOADON
where MAKH is null

--21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select  count( distinct b.masp)
from HOADON a left join CTHD b on a.SOHD = b.SOHD
where year(a.nghd) = 2006

--22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select max(trigia),min(trigia)
from HOADON

--23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(trigia)
from HOADON
where year(nghd) = 2006

--24.	Tính doanh thu bán hàng trong năm 2006.
select sum(trigia) as revenue
from HOADON
where year(nghd) = 2006

--25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select sohd
from HOADON
where trigia in (select max(trigia) from HOADON where year(nghd) = 2006)
--26.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
with trigia as(
	select sohd,MAKH
	from HOADON
	where trigia in (select max(trigia) from HOADON where year(nghd) = 2006))

select a.HOTEN
from KHACHHANG a inner join trigia b on a.MAKH = b.MAKH

--27.	In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
select top 3 makh,hoten,DOANHSO
from KHACHHANG
order by DOANHSO desc

--28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select masp,tensp
from SANPHAM
where GIA in(	SELECT DISTINCT TOP 3 sp.GIA
				FROM SANPHAM sp
				ORDER BY sp.GIA DESC)
--29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
select masp,TENSP
from SANPHAM
where NUOCSX = 'Thai Lan' and gia in (	SELECT DISTINCT TOP 3 sp.GIA
										FROM SANPHAM sp
										ORDER BY sp.GIA DESC)

--30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select masp,TENSP
from SANPHAM
where NUOCSX = 'Trung Quoc' and gia in (SELECT DISTINCT TOP 3 sp.GIA
										FROM SANPHAM sp
										where NUOCSX = 'Trung Quoc'
										ORDER BY sp.GIA DESC)
--31.* In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
select top 3 rank () over (order by doanhso desc) as 'rank', makh,hoten,DOANHSO
from khachhang
order by DOANHSO desc

--32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(masp)
from SANPHAM
where NUOCSX = 'Trung Quoc'

--33.	Tính tổng số sản phẩm của từng nước sản xuất.
select  NUOCSX,count(masp)
from SANPHAM
group by NUOCSX
--34.	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select  NUOCSX,max(gia) 'Cao Nhat',min(gia)'Thap Nhat',avg(gia)'Trung Binh'
from SANPHAM
group by NUOCSX

--35.	Tính doanh thu bán hàng mỗi ngày.
select nghd,sum(TRIGIA) revenue
from HOADON
group by NGHD

--36.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select b.masp,sum(b.sl)
from HOADON a left join CTHD b on a.SOHD = b.SOHD
where MONTH(nghd) = 10 and year(nghd) = 2006
group by b.MASP

--37.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(nghd),sum(trigia) revenue
from HOADON
where year(nghd) = 2006
group by month(nghd)

--38.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select b.SOHD,count(b.masp) as sl
from HOADON a left join CTHD b on a.SOHD = b.SOHD
group by b.SOHD
having count(b.masp) >=4

--39.	Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select b.SOHD , count(b.masp) as num
from SANPHAM a left join CTHD b on a.MASP = b.MASP
where a.NUOCSX = 'Viet Nam'
group by b.SOHD
having count(b.masp) >=3
--40.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
with maxbuy as (
	select top 1 MAKH, count(sohd) as num
	from HOADON
	where MAKH is not null
	group by MAKH
)
select a.makh,a.hoten
from KHACHHANG a inner join maxbuy b on a.MAKH = b.MAKH

--41.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select top 1 MONTH(nghd) as 'Month',sum(trigia) as 'doanh so'
from HOADON
where year(nghd) = 2006
group by month(nghd)
order by [doanh so] desc


--42.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
with total as (
	select b.MASP,sum(b.sl) as 'total'
	from HOADON a left join CTHD b on a.SOHD = b.SOHD
	where year(a.nghd) = 2006
	group by b.masp
)
select top 1 a.MASP,a.TENSP,total
from SANPHAM a inner join total b on a.MASP = b.MASP
order by total

--43.	*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất..
select MASP,TENSP
from sanpham a, 
	(select NUOCSX,max(gia) as 'max gia'
	from SANPHAM 
	group by NUOCSX) AS b
where a.NUOCSX = b.NUOCSX and a.GIA = b.[max gia]

--44.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select NUOCSX
from SANPHAM
group by nuocsx
having count(distinct gia)>=3
--45.	*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
with buyer as (
select MAKH,count(sohd) as num
from HOADON
group by MAKH)

select top 1 a.MAKH,a.HOTEN,b.num
from KHACHHANG a left join buyer b on a.MAKH = b.MAKH
order by num desc



