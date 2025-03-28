# README - Hướng dẫn về DBMS và SQL Server

## Mục lục

1. [Các đặc điểm của mô hình DBMS](#cac-dac-diem-cua-mo-hinh-dbms)
2. [Ngôn ngữ trong DBMS](#ngon-ngu-trong-dbms)
   - [Ngôn ngữ định nghĩa dữ liệu (DDL)](#ddl)
   - [Ngôn ngữ thao tác dữ liệu (DML)](#dml)
3. [Phân loại End-Users](#phan-loai-end-users)
4. [Trách nhiệm của DBA](#trach-nhiem-cua-dba)
5. [Tổ chức CSDL](#to-chuc-csdl)
6. [RAID và Lưu trữ](#raid-va-luu-tru)
7. [Database trong SQL Server](#database-trong-sql-server)
8. [Quản trị đối tượng CSDL](#quan-tri-doi-tuong-csdl)
9. [Ràng buộc trong SQL](#rang-buoc-trong-sql)

---

## Các đặc điểm của mô hình DBMS

- **Trừu tượng hóa dữ liệu:** Mô hình dữ liệu chỉ hiển thị mô hình vật lý ở mức ý niệm.
- **Hỗ trợ nhiều góc nhìn:** Người dùng có thể truy vấn và thao tác theo nhiều cách khác nhau.
- **Chia sẻ dữ liệu và xử lý đồng thời:** Hỗ trợ nhiều người dùng truy cập đồng thời mà không xung đột dữ liệu.

## Ngôn ngữ trong DBMS

### Ngôn ngữ định nghĩa dữ liệu (DDL)

- Cho phép xác định sơ đồ bằng đặc tả dữ liệu (`data dictionary`).

### Ngôn ngữ thao tác dữ liệu (DML)

- Hỗ trợ thao tác dữ liệu như truy vấn (`SELECT`), chèn (`INSERT`), cập nhật (`UPDATE`), xóa (`DELETE`).

## Phân loại End-Users

- **Casual Users:** Người dùng thỉnh thoảng truy cập dữ liệu khi cần.
- **Naive Users:** Nhóm đông nhất, sử dụng các chức năng đặt sẵn, ví dụ: nhân viên bán hàng.
- **Sophisticated Users:** Các kỹ sư, phân tích viên dữ liệu.
- **Standalone Users:** Người dùng máy tính cá nhân để thao tác với CSDL.

## Trách nhiệm của DBA

1. **Bảo mật:** Quản lý quyền truy cập và xác thực người dùng.
2. **Độ sẵn sàng cao:** Đảm bảo hệ thống luôn hoạt động ngay cả khi có sự cố.
3. **Độ tin cậy:** Chẩn đoán, bảo trì hệ thống và phát hiện lỗi.
4. **Khả năng phục hồi:** Khôi phục dữ liệu nhanh chóng khi gặp lỗi.

## Tổ chức CSDL

### Các tác vụ trên tập tin

1. **Truy xuất dữ liệu:** Chỉ đọc dữ liệu mà không thay đổi.
2. **Cập nhật dữ liệu:** Chỉnh sửa, thêm hoặc xóa dữ liệu.

## RAID và Lưu trữ

| Loại RAID   | Mô tả                                                                 |
| ----------- | --------------------------------------------------------------------- |
| **RAID 0**  | Tăng hiệu suất đọc/ghi, không có dự phòng dữ liệu.                    |
| **RAID 1**  | Ghi dữ liệu trên 2 ổ đĩa giống nhau, tăng độ an toàn.                 |
| **RAID 5**  | Dữ liệu trải rộng trên nhiều ổ đĩa, có khả năng phục hồi nếu mất 1 ổ. |
| **RAID 10** | Kết hợp RAID 1 & RAID 0, có cả hiệu suất và dự phòng dữ liệu.         |

## Database trong SQL Server

- **Data file:** Lưu dữ liệu, bảng, index (Tối đa 32TB).
- **Log file:** Lưu thông tin transaction log (Tối đa 4TB).
- **Primary data file (**``**)**: Chứa thông tin khởi động và liên kết đến các file khác.
- **Secondary data file (**``**)**: Các file mở rộng dữ liệu.
- **Transaction log files (**``**)**: Lưu lịch sử giao dịch của database.

## Quản trị đối tượng CSDL

### Các database hệ thống trong SQL Server

- **Master:** Lưu thông tin hệ thống, cấu hình, tài khoản đăng nhập.
- **Tempdb:** Giữ bảng tạm (`temporary tables`).
- **Model:** Mẫu cho database mới được tạo.
- **Msdb:** Quản lý lịch trình (`jobs`) và cảnh báo.
## Hàm trong SQL
# 📌 Danh sách các hàm SQL Server cơ bản

## Nhóm hàm ngày tháng (Date & Time)
| Hàm | Chức năng | Ví dụ |
|------|----------|-------|
| `GETDATE()` | Lấy ngày giờ hiện tại | `SELECT GETDATE();` |
| `SYSDATETIME()` | Lấy ngày giờ chính xác hơn `GETDATE()` | `SELECT SYSDATETIME();` |
| `DATEADD(unit, số_lượng, ngày_gốc)` | Cộng/trừ một khoảng thời gian vào ngày | `SELECT DATEADD(DAY, 10, '2024-03-14');` |
| `DATEDIFF(unit, ngày1, ngày2)` | Tính khoảng cách giữa 2 ngày | `SELECT DATEDIFF(YEAR, '2000-01-01', '2025-03-14');` |
| `DATENAME(unit, ngày)` | Trả về tên của đơn vị thời gian | `SELECT DATENAME(WEEKDAY, GETDATE());` |
| `YEAR(ngày)` | Lấy năm của ngày | `SELECT YEAR(GETDATE());` |
| `MONTH(ngày)` | Lấy tháng của ngày | `SELECT MONTH(GETDATE());` |
| `DAY(ngày)` | Lấy ngày của tháng | `SELECT DAY(GETDATE());` |

## Nhóm hàm xử lý chuỗi (String Functions)
| Hàm | Chức năng | Ví dụ |
|------|----------|-------|
| `LEN(chuỗi)` | Độ dài chuỗi (không tính khoảng trắng cuối) | `SELECT LEN('Hello');` |
| `CHARINDEX('chuỗi', nguồn)` | Tìm vị trí chuỗi con | `SELECT CHARINDEX('SQL', 'Hello SQL Server');` |
| `LEFT(chuỗi, số_ký_tự)` | Lấy N ký tự từ trái | `SELECT LEFT('Database', 4);` → `Data` |
| `RIGHT(chuỗi, số_ký_tự)` | Lấy N ký tự từ phải | `SELECT RIGHT('Database', 4);` → `base` |
| `SUBSTRING(chuỗi, vị_trí, số_ký_tự)` | Cắt chuỗi con | `SELECT SUBSTRING('Hello SQL', 7, 3);` → `SQL` |
| `UPPER(chuỗi)` | Chuyển thành chữ hoa | `SELECT UPPER('sql server');` |
| `LOWER(chuỗi)` | Chuyển thành chữ thường | `SELECT LOWER('SQL SERVER');` |
| `REPLACE(chuỗi, tìm, thay thế)` | Thay thế chuỗi | `SELECT REPLACE('SQL Server 2024', '2024', '2025');` |
| `LTRIM(chuỗi)` | Xóa khoảng trắng đầu chuỗi | `SELECT LTRIM('  Hello ');` |
| `RTRIM(chuỗi)` | Xóa khoảng trắng cuối chuỗi | `SELECT RTRIM('Hello  ');` |
| `CONCAT(chuỗi1, chuỗi2,...)` | Nối chuỗi | `SELECT CONCAT('Hello', ' ', 'SQL');` |

## Nhóm hàm toán học (Math Functions)
| Hàm | Chức năng | Ví dụ |
|------|----------|-------|
| `ABS(số)` | Giá trị tuyệt đối | `SELECT ABS(-10);` |
| `CEILING(số)` | Làm tròn lên | `SELECT CEILING(4.2);` → `5` |
| `FLOOR(số)` | Làm tròn xuống | `SELECT FLOOR(4.9);` → `4` |
| `ROUND(số, số_làm_tròn)` | Làm tròn số | `SELECT ROUND(3.14159, 2);` → `3.14` |
| `POWER(số, lũy_thừa)` | Lũy thừa | `SELECT POWER(2, 3);` → `8` |
| `SQRT(số)` | Căn bậc hai | `SELECT SQRT(25);` → `5` |
| `RAND()` | Sinh số ngẫu nhiên | `SELECT RAND();` |

## Nhóm hàm tổng hợp (Aggregate Functions)
| Hàm | Chức năng | Ví dụ |
|------|----------|-------|
| `SUM(cột)` | Tính tổng | `SELECT SUM(Salary) FROM Employees;` |
| `AVG(cột)` | Tính trung bình | `SELECT AVG(Age) FROM Students;` |
| `MIN(cột)` | Lấy giá trị nhỏ nhất | `SELECT MIN(Salary) FROM Employees;` |
| `MAX(cột)` | Lấy giá trị lớn nhất | `SELECT MAX(Salary) FROM Employees;` |
| `COUNT(*)` | Đếm số dòng | `SELECT COUNT(*) FROM Orders;` |

## Nhóm hàm điều kiện (Conditional Functions)
| Hàm | Chức năng | Ví dụ |
|------|----------|-------|
| `CASE WHEN ... THEN ... ELSE ... END` | Điều kiện IF-ELSE trong SQL | ```SELECT Name, CASE WHEN Age >= 18 THEN 'Adult' ELSE 'Minor' END FROM Students;``` |
| `COALESCE(a, b, c,...)` | Trả về giá trị đầu tiên khác NULL | `SELECT COALESCE(NULL, NULL, 'Hello');` |
| `ISNULL(cột, giá_trị_mới)` | Thay thế giá trị NULL | `SELECT ISNULL(NULL, 'No Data');` |

## Ràng buộc trong SQL

### Các loại ràng buộc phổ biến

| Ràng buộc       | Ý nghĩa                                                       |
| --------------- | ------------------------------------------------------------- |
| **PRIMARY KEY** | Định danh duy nhất cho mỗi dòng, không NULL, không trùng lặp. |
| **FOREIGN KEY** | Liên kết giữa hai bảng.                                       |
| **UNIQUE**      | Đảm bảo dữ liệu trong cột là duy nhất.                        |
| **CHECK**       | Đặt điều kiện cho dữ liệu đầu vào.                            |
| **DEFAULT**     | Cung cấp giá trị mặc định khi không nhập dữ liệu.             |

### Ví dụ tạo bảng và ràng buộc

```sql
-- Tạo bảng SinhVien với khóa chính
CREATE TABLE SinhVien(
    MaSV INT PRIMARY KEY NOT NULL,
    HoTen NVARCHAR(100),
    NgaySinh DATETIME
);

-- Thêm khóa chính vào bảng đã tạo
ALTER TABLE SinhVien ADD CONSTRAINT PK_SinhVien PRIMARY KEY (MaSV);

-- Tạo khóa ngoại liên kết với bảng LopHoc
CREATE TABLE LopHoc(
    MaLop CHAR(10) NOT NULL PRIMARY KEY,
    TenLop NVARCHAR(50)
);

CREATE TABLE SinhVien(
    MaSV INT PRIMARY KEY NOT NULL,
    HoTen NVARCHAR(100),
    NgaySinh DATETIME,
    MaLop CHAR(10) FOREIGN KEY REFERENCES LopHoc(MaLop)
);

-- Thêm khóa ngoại sau khi bảng đã được tạo
ALTER TABLE SinhVien ADD CONSTRAINT FK_SinhVien_LopHoc FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop);

-- Xóa ràng buộc khóa ngoại
ALTER TABLE SinhVien DROP CONSTRAINT FK_SinhVien_LopHoc;

-- Tạo ràng buộc UNIQUE
CREATE TABLE NhanVien(
    MaNV INT PRIMARY KEY NOT NULL,
    Email NVARCHAR(100) UNIQUE
);

-- Thêm ràng buộc UNIQUE vào bảng đã tồn tại
ALTER TABLE NhanVien ADD CONSTRAINT UQ_NhanVien_Email UNIQUE (Email);

-- Xóa ràng buộc UNIQUE
ALTER TABLE NhanVien DROP CONSTRAINT UQ_NhanVien_Email;
-- Thêm NOT NULL vào cột đã tồn tại
ALTER TABLE NhanVien 
ALTER COLUMN MaNV INT NOT NULL;

-- Thêm NULL cho cột ALTER TABLE MonHoc 
ALTER TABLE NhanVien
ALTER COLUMN MaNV INT NULL;

-- Ràng buộc CHECK kiểm tra điều kiện 
CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    Diem FLOAT CHECK (Diem >= 0 AND Diem <= 10) -- Điểm chỉ từ 0 đến 10
);

-- Ràng buộc DEFAULT giá trị mặc định 
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    TrangThai BIT DEFAULT 1 -- Mặc định là "đang làm việc" (1)
);
-- Thêm ràng buộc khi đã tạo bảng 
ALTER TABLE NhanVien 
ADD CONSTRAINT DF_NhanVien_TrangThai DEFAULT 1 FOR TrangThai;

-- Thêm ràng buộc CHECK khi đã tạo bảng 
ALTER TABLE SinhVien 
ADD CONSTRAINT CK_SinhVien_Diem CHECK (Diem >= 0 AND Diem <= 10);


```

## Kiểm tra thông tin database

```sql
EXEC sp_helpdb 'Testdb';
```
## Collation

| Collation | Phân biệt hoa thường | Phân biệt có giấu | Ví dụ             |
| --------- | -------------------- | ----------------- | ----------------- |
| `CI_AS `| `Không`| `Có`                | `DũNG , Dũng`       |
| `CI_AI`     | `Không`                | `Không`             | `Dũng ,DUng , DŨNG `|
| `CS_AS`     | `Có`                   |` Có `               | `Dũng ` |
|`CS_AI`    | `Có `                  | `Không `            | `Dũng ,Dung` |
### ví dụ
```sql
SELECT * FROM BANH
WHERE TenSP LIKE 'Bánh%'
COLLATE LATIN1_GENERAL_CS_AI;
```
## Một số table đặc biệt
### Bảng tạm (temporary tabe)
dùng để lưu trữ dữ liệu tạm thời trong quá trình sử lý , dữ liệu của table sẽ lưu trong tempdb
cách tạo như bình thường nhưng tên bắt đầu bằng giấu `#(local)` hoặc `##(Global)`
khi kết thúc quá trình sử lí table sẽ tự động xóa đi
#### Cách tạo 1:
```sql
CREATE TABLE #SINHVIEN(
    MA CHAR(5),
    DIEM INT
);

------ CÁCH DÙNG
SELECT * FROM #SINHVIEN
INSERT INTO #SINHVIEN VALUES ('SM',5);

```
#### Cách tạo 2
```sql
SELECT MA,TEN,DIEM INTO # TEMP1
FROM SINHVIEN
WHERE MA = 'MS1'
```

### CTE (Common Table Expression)
chứa dữ liệu tạm thời được định nghĩa của nó 
- không lưu trữ như một đối tượng và chỉ tồn tại trong suốt thời gian của câu truy vấn
- cho phép nhóm một cột từ truy vấn con
- Có thể tham chiếu đến bản thân nó nhiều lần trong một câu truy vấn
- Có thể dùng để truy vấn đệ quy
- Sử dụng thay thế view trong một số trường hợp

#### Cách tạo 
```sql
WITH 
    thu AS (SELECT NgayThu, SUM(sotien) AS TongThu
            FROM PhieuThu 
            GROUP BY NgayThu),
    chi AS (SELECT NgayChi, SUM(sotien) AS TongChi
            FROM PhieuChi
            GROUP BY NgayChi)

SELECT ISNULL(ngaythu,ngaychi) AS ngay,TongThu, TongChi
FROM thu FULL JOIN chi ON ngaythu=ngaychi

-----------------
WITH 
    ThuChi(ngay, thu, chi) AS (
        SELECT NgayThu, sotien, 0
        FROM PhieuThu
        UNION ALL
        SELECT NgayChi, 0, sotien
        FROM PhieuChi
    )

SELECT Ngay, sum(thu) AS TongThu, sum(chi) AS TongChi
FROM ThuChi
GROUP BY Ngay

--------- ĐỆ QUY

WITH cte100(n) AS (
SELECT 10
UNION ALL
SELECT n+10 FROM cte100 WHERE n<100
)
SELECT * FROM cte100;
```

### Memory-Optimized Table
- dữ liệu được lưu trữ trong bộ nhớ ram
- một bản copy sẽ được lưu vào ổ cứng để đảm bảo an toàn dữ liệu 
- dữ liệu chỉ được đọc lại từ ổ cứng khi quá trình recovery
#### Cách tạo
```sql
--- NẾU ĐÃ CÓ DATABASE
ALTER DATABASE TENDB
ADD FILEGROUP TENDB CONTAINS MEMORY_OPTIMIZED_DATA;
---CONTAINS MEMORY_OPTIMIZED_DATA báo cho SQL biết đây là filegroup chứa bảng RAM.

ALTER DATABASE ThucTap  
ADD FILE  
(name = [file_mem], filename='D:\SQLDB\file_mem.db')  
TO FILEGROUP ThucTap;
--- TẠO BẢN BACKUP VẬT LÝ 

--- TẠO BẢNG LƯU TRỮ TRÊN RAM
CREATE TABLE NGOAITE(
    MaNT CHAR(4) PRIMARY KEY NONCLUSTERED,
    TenNT NVARCHAR(100),
    MuaTienMat DECIMAL(18,2) DEFAULT 0,
    MuaChuyenKhoan DECIMAL(18,2) DEFAULT 0,
    Ban DECIMAL(18,2) DEFAULT 0
) WITH (
    MEMORY_OPTIMIZED = ON
    DURABILITY = SCHEMA_AND_DATA
    );

INSERT INTO NGOAITE VALUES 
('USD', N'Đô la Mỹ', 23500.00, 23450.00, 23600.00),
('EUR', N'Euro', 25600.00, 25500.00, 25700.00),
('JPY', N'Yên Nhật', 170.50, 169.80, 171.20),
('CNY', N'Nhân dân tệ', 3300.00, 3290.00, 3310.00);
```
### Partitioned Tables (Bảng phân mảnh)
- Table partitioning là phân chia các dòng dữ liệu trong bảng thành các phần nhỏ
  có thể lưu các mảnh thành các filegroup khác nhau
#### Partition function:
    Chia khoảng dữ liệu
#### Partition Scheme
    Gắn mỗi khoảng vào đâu (filegroup nào)
### Bảng hoặc chỉ mục sử dụng Partition
   Dữ liệu tự động chia vùng khi insert
### cách tạo Partition Function
Phân mảnh dựa vào giá trị là số
```sql
CREATE PARTITION FUNCTION PartFunc1(INT)
AS RANGE LEFT FOR VALUES (1000, 2000, 3000)
```






