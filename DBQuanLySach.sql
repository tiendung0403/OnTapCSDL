USE QUANLYKHO
go
exec sp_changedbowner 'sa'
GO
CREATE TABLE nhanvien(
	manv char(10) primary key not null,
	hoten nvarchar(100) not null,
	ngaysinh date,
	phai bit,
	diachi nvarchar(50),
	bienche nvarchar(100),
	ngaybatdau datetime,
	luongcoban float,
	ghichu nvarchar(100),
);
go
create table nhapxuat(
	stt int identity(1,1) primary key,
	ngay datetime,
	loai char(4),
	phieu char(10),
	hoten nvarchar(100) not null,
	lydo nvarchar(100) not null,
	makho char(4),
	mavt char(10) ,
	solg int,
	tien float,
	manv char(10)
);
go
create table kho(
	makho char(4) primary key not null,
	tenkho nvarchar(100),
	diachikho nvarchar(100),
);

go 
create table vattu(
	mavt char(10) primary key not null,
	tenvattu nvarchar(100),
	quycach nvarchar(100),
	dvtinh nvarchar(100),
)
go
alter table nhapxuat add constraint FK_nhapxuatVT_Vattu
foreign key (mavt) references vattu(mavt);  
go
alter table nhapxuat add constraint FK_nhapxuatMAKHO_KHO
foreign key (makho) references kho(makho); 
go
alter table nhapxuat add constraint FK_nhapxuatMANV
foreign key (manv) references nhanvien(manv);
go
INSERT INTO nhanvien (manv, hoten, ngaysinh, phai, diachi, bienche, ngaybatdau, luongcoban, ghichu)
VALUES
('sp01', 'Nguyen Duy Hung', '1985-01-01', 1, 'Hà Nội', 'Biên chế', '2023-01-01', 5000000, 'Không có'),
('sp02', 'Tran Thi Mai', '1990-05-15', 0, 'TP. Hồ Chí Minh', 'Biên chế', '2023-06-15', 6000000, 'Không có'),
('sp03', 'Le Quang Hieu', '1988-11-25', 1, 'Đà Nẵng', 'Thử việc', '2024-02-01', 4500000, 'Chưa có'),
('sp04', 'Pham Thi Lan', '1992-07-30', 0, 'Hà Nội', 'Biên chế', '2024-03-01', 5500000, 'Không có');

go
INSERT INTO kho (makho, tenkho, diachikho)
VALUES
('K001', 'Kho A', 'Hà Nội'),
('K002', 'Kho B', 'TP. Hồ Chí Minh'),
('K003', 'Kho C', 'Đà Nẵng');
go
INSERT INTO vattu (mavt, tenvattu, quycach, dvtinh)
VALUES
('VT001', 'Cement', '50kg/bag', 'Kilogram'),
('VT002', 'Steel Bar', '12m/rod', 'Meter'),
('VT003', 'Wood', '2m/board', 'Meter'),
('VT004', 'Paint', '5L/can', 'Liter');
go
INSERT INTO nhapxuat (ngay, loai, phieu, hoten, lydo, makho, mavt, solg, tien, manv)
VALUES
('2025-03-01', 'NHAP', 'PX001', 'Nguyen Duy Hung', 'Nhập kho', 'K001', 'VT001', 100, 1000000, 'sp01'),
('2025-03-02', 'XUAT', 'PX002', 'Tran Thi Mai', 'Xuất kho', 'K002', 'VT002', 50, 2500000, 'sp02'),
('2025-03-03', 'NHAP', 'PX003', 'Le Quang Hieu', 'Nhập kho', 'K003', 'VT003', 200, 1500000, 'sp03'),
('2025-03-04', 'XUAT', 'PX004', 'Pham Thi Lan', 'Xuất kho', 'K001', 'VT004', 30, 900000, 'sp04');
go
select * from nhapxuat
go

ALTER TABLE nhapxuat
ADD CONSTRAINT DF_SOLG DEFAULT 1 FOR solg;

go
ALTER TABLE nhapxuat
ADD CONSTRAINT DF_TIEN DEFAULT 0 FOR tien;

go
--Bổ sung ràng buộc cho bảng NHANVIEN để đảm bảo rằng một nhân viên chỉ có thể làm 
--việc trong công ty khi đủ 18 tuổi và không quá 60 tuổi
go
select * from nhanvien
go
alter table nhanvien add constraint ngaysinh check(datediff(year,ngaysinh,getdate())between 18 and 60);
insert into nhanvien
VALUES
('sp01', 'Nguyen Duy Hung', '2025-01-01', 1, 'Hà Nội', 'Biên chế', '2023-01-01', 5000000, 'Không có');
