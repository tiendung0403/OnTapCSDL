IF DB_ID('QuanLyKho') IS NULL
BEGIN 
	CREATE DATABASE QuanLyKho
END
GO
USE QuanLyKho

GO
-- exec sp_changedbowner 'sa'
ALTER AUTHORIZATION ON DATABASE :: QuanLyKho TO sa;
GO
CREATE TABLE nhanvien(
	manv VARCHAR(10) PRIMARY KEY NOT NULL,
	hoten NVARCHAR(100) NOT NULL,
	ngaysinh DATE NOT NULL CHECK (ngaysinh <= DATEADD(YEAR, -18, GETDATE()) AND ngaysinh >= DATEADD(YEAR, -60, GETDATE())),
	phai BIT DEFAULT 1,
	diachi NVARCHAR(50),
	bienche NVARCHAR(20) CHECK (bienche IN (N'Biên chế', N'Thử việc', N'Hợp đồng',N'Hết tuổi lao động')),
	ngaybatdau DATE,
	luongcoban DECIMAL(18,2) DEFAULT 0,
	ghichu NVARCHAR(100)
);
go
CREATE PROCEDURE UpdateNhanVienStatus
AS
BEGIN
    UPDATE nhanvien
    SET bienche = N'Hết tuổi lao động'
    WHERE DATEDIFF(YEAR, ngaysinh, GETDATE()) > 60;
END;

create table kho(
	makho VARCHAR(4) primary key not null,
	tenkho nvarchar(100) NOT NULL,
	diachikho nvarchar(100) NOT NULL,
);

create table vattu(
	mavt VARCHAR(10) primary key not null,
	tenvattu nvarchar(100),
	quycach nvarchar(100),
	donvitinh nvarchar(100),
)
go
create table nhapxuat(
	stt int identity(1,1) primary key,
	ngay DATE NOT NULL,
	loai char(4),
	phieu char(10),
	hoten nvarchar(100) NOT NULL,
	lydo nvarchar(100) NOT NULL,
	makho VARCHAR(4) NOT NULL,
	mavt VARCHAR(10) NOT NULL,
	soluong int DEFAULT 1,
	tien DECIMAL(18,2) DEFAULT 0,
	manv VARCHAR(10)
);
go
alter table nhapxuat add constraint FK_nhapxuatVT_Vattu foreign key (mavt) references vattu(mavt);  
alter table nhapxuat add constraint FK_nhapxuatMAKHO_KHO foreign key (makho) references kho(makho); 
alter table nhapxuat add constraint FK_nhapxuatMANV foreign key (manv) references nhanvien(manv);

go
INSERT INTO nhanvien (manv, hoten, ngaysinh, phai, diachi, bienche, ngaybatdau, luongcoban, ghichu)
VALUES
('sp01', N'Nguyen Duy Hung', '1985-01-01', 1, N'Hà Nội', N'Biên chế', '2023-01-01', 5000000, N'Không có'),
('sp02', N'Tran Thi Mai', '1990-05-15', 0, N'TP. Hồ Chí Minh', N'Biên chế', '2023-06-15', 6000000, N'Không có'),
('sp03', N'Le Quang Hieu', '1988-11-25', 1, N'Đà Nẵng', N'Thử việc', '2024-02-01', 4500000, N'Chưa có'),
('sp04', N'Pham Thi Lan', '1992-07-30', 0, N'Hà Nội', N'Biên chế', '2024-03-01', 5500000, N'Không có');

INSERT INTO kho (makho, tenkho, diachikho)
VALUES
('K001', 'Kho A', N'Hà Nội'),
('K002', 'Kho B', N'TP. Hồ Chí Minh'),
('K003', 'Kho C', N'Đà Nẵng');

INSERT INTO vattu (mavt, tenvattu, quycach, donvitinh)
VALUES
('VT001', 'Cement', '50kg/bag', 'Kilogram'),
('VT002', 'Steel Bar', '12m/rod', 'Meter'),
('VT003', 'Wood', '2m/board', 'Meter'),
('VT004', 'Paint', '5L/can', 'Liter');

INSERT INTO nhapxuat (ngay, loai, phieu, hoten, lydo, makho, mavt, soluong, tien, manv)
VALUES
('2025-03-01', 'NHAP', 'PX001', N'Nguyen Duy Hung', N'Nhập kho', 'K001', 'VT001', 100, 1000000, 'sp01'),
('2025-03-02', 'XUAT', 'PX002', N'Tran Thi Mai', N'Xuất kho', 'K002', 'VT002', 50, 2500000, 'sp02'),
('2025-03-03', 'NHAP', 'PX003', N'Le Quang Hieu', N'Nhập kho', 'K003', 'VT003', 200, 1500000, 'sp03'),
('2025-03-04', 'XUAT', 'PX004', N'Pham Thi Lan', N'Xuất kho', 'K001', 'VT004', 30, 900000, 'sp04');


