# README - Hướng dẫn về DBMS và SQL Server
# Mục lục

1. [Tháp DIKW](#tháp-dikw)
2. [Các loại table đặc biệt](#các-loại-table-đặc-biệt)
   - [Temporary Table (Bảng tạm)](#temporary-table-bảng-tạm)
   - [CTE (Common Table Expression)](#cte-common-table-expression)
   - [Memory-Optimized Tables](#memory-optimized-tables)
   - [Partitioned Tables](#partitioned-tables)
   - [Temporal Tables](#temporal-tables)
3. [View](#view)
4. [Index](#index)
5. [Cursor](#cursor)
6. [Các đặc điểm của mô hình DBMS](#các-đặc-điểm-của-mô-hình-dbms)
7. [Ngôn ngữ trong DBMS](#ngôn-ngữ-trong-dbms)
   - [Ngôn ngữ định nghĩa dữ liệu (DDL)](#ngôn-ngữ-định-nghĩa-dữ-liệu-ddl)
   - [Ngôn ngữ thao tác dữ liệu (DML)](#ngôn-ngữ-thao-tác-dữ-liệu-dml)
8. [Phân loại End-Users](#phân-loại-end-users)
9. [Trách nhiệm của DBA](#trách-nhiệm-của-dba)
10. [Tổ chức CSDL](#tổ-chức-csdl)
11. [RAID và Lưu trữ](#raid-và-lưu-trữ)
12. [Database trong SQL Server](#database-trong-sql-server)
13. [Quản trị đối tượng CSDL](#quản-trị-đối-tượng-csdl)
14. [Ràng buộc trong SQL](#ràng-buộc-trong-sql)
15. [Hàm trong SQL](#hàm-trong-sql)

# Chương 1

## Tháp DIKW


Tháp DIKW là một mô hình mô tả quá trình chuyển đổi dữ liệu từ thô sang hiểu biết sâu sắc, bao gồm 4 cấp độ:

### Level 1: Data (Dữ liệu thô)
- Dữ liệu được thu thập từ nhiều nguồn khác nhau.
- Tồn tại độc lập, chưa qua xử lý, ví dụ: "Hà Nội", "25", hình ảnh.

### Level 2: Information (Thông tin = Data + Context)
- Dữ liệu được sắp xếp và tổ chức có ý nghĩa.
- Có thể trả lời các câu hỏi như "ở đâu", "cái gì", "cái nào".
- Ví dụ: "HCM hôm nay 25 độ, không mưa".

### Level 3: Knowledge (Kiến thức = Information + Meaning)
- Thông tin được gắn với định nghĩa và ý nghĩa.
- Là kết quả của quá trình học tập và chắt lọc thông tin.

### Level 4: Wisdom (Trí tuệ)
- Tư duy, thông thái, tập hợp kiến thức chuyên sâu về một lĩnh vực cụ thể.

---


## Các đặc điểm của DBMS

### 1. Tự mô tả (Self-Describing Nature)
- DBMS có catalog nội bộ để lưu trữ metadata (dữ liệu về dữ liệu).
- Metadata bao gồm: cấu trúc bảng, kiểu dữ liệu, ràng buộc, quyền truy cập...
- Giúp hệ thống làm việc với nhiều cơ sở dữ liệu mà không cần thiết lập thủ công.

### 2. Cách ly chương trình và dữ liệu (Program-Data Independence)
- Cho phép thay đổi cấu trúc dữ liệu (thêm cột, đổi kiểu dữ liệu) mà không cần sửa đổi toàn bộ chương trình truy cập CSDL.
- Giúp hệ thống dễ mở rộng, bảo trì và linh hoạt hơn.

### 3. Trừu tượng hóa dữ liệu (Data Abstraction)
- DBMS ẩn chi tiết lưu trữ dữ liệu trên ổ đĩa, người dùng chỉ làm việc với mô hình dữ liệu ở mức logic.
- Ba mức trừu tượng hóa dữ liệu:
  1. **Mức vật lý (Physical Level)**: Cách dữ liệu được lưu trên đĩa.
  2. **Mức logic (Logical Level)**: Cấu trúc dữ liệu và mối quan hệ giữa chúng.
  3. **Mức xem (View Level)**: Dữ liệu hiển thị cho từng nhóm người dùng.

### 4. Hỗ trợ nhiều góc nhìn (Multiple Views)
- Một cơ sở dữ liệu cung cấp nhiều góc nhìn khác nhau cho từng loại người dùng.
- Ví dụ:
  - Người quản lý thấy toàn bộ dữ liệu nhân sự.
  - Nhân viên chỉ thấy thông tin cá nhân của họ.
- Giúp tăng bảo mật và tối ưu hóa truy vấn.

### 5. Chia sẻ dữ liệu và xử lý đồng thời (Data Sharing & Concurrency Control)
- Hỗ trợ nhiều người dùng truy cập CSDL cùng lúc mà không gây lỗi hoặc xung đột.
- Cơ chế kiểm soát đồng thời (Concurrency Control) đảm bảo tính nhất quán và tránh deadlock.
- Ví dụ: Hệ thống ngân hàng cho phép nhiều giao dịch cập nhật tài khoản cùng lúc mà không sai sót.

### 6. Ràng buộc toàn vẹn (Data Integrity)
- Đảm bảo tính chính xác và đồng nhất của dữ liệu.
- Sử dụng các ràng buộc như:
  - Primary Key (khóa chính)
  - Foreign Key (khóa ngoại)
  - Unique, Not Null, Check, Default
- Ví dụ: Không thể nhập đơn hàng với mã khách hàng không tồn tại.

### 7. Cơ chế bảo mật mạnh mẽ (Security & Authorization) 🔐
- Kiểm soát quyền truy cập dựa trên vai trò người dùng.
- Hỗ trợ mã hóa dữ liệu để chống truy cập trái phép.
- Ví dụ:
  - Admin: thêm/sửa/xóa dữ liệu.
  - Khách hàng: chỉ xem thông tin đơn hàng.

### 8. Hỗ trợ sao lưu và phục hồi dữ liệu (Backup & Recovery) 💾
- Bảo vệ CSDL khỏi lỗi do mất điện, hỏng ổ cứng, tấn công mạng...
- Cung cấp cơ chế sao lưu tự động và khôi phục dữ liệu để tránh mất mát.

### 9. Hiệu suất cao và tối ưu hóa truy vấn (Query Optimization) 🚀
- Sử dụng thuật toán tối ưu hóa để tăng tốc độ xử lý truy vấn SQL.
- Chỉ mục (Indexing), phân mảnh (Partitioning), bộ nhớ đệm (Caching) giúp truy xuất dữ liệu nhanh hơn.
- Ví dụ: Google Search tìm kiếm hàng tỷ dữ liệu trong vài mili giây.

### 10. Hỗ trợ nhiều mô hình dữ liệu (Multiple Data Models)
- DBMS hỗ trợ các mô hình dữ liệu như:
  - Mô hình quan hệ (Relational Model - SQL): MySQL, SQL Server
  - Mô hình hướng đối tượng (Object-Oriented Model): MongoDB
  - Mô hình đồ thị (Graph Database): Neo4j
  - Mô hình khóa-giá trị (Key-Value Model): Redis

## Thành phần của DBMS
- **Data**: Dữ liệu.
- **Metadata**: Siêu dữ liệu mô tả cấu trúc lược đồ của CSDL.
- **Statistics**: Dữ liệu thống kê về đặc tính của dữ liệu (kích thước, giá trị...).
- **Index**: Chỉ mục, cấu trúc dữ liệu hỗ trợ truy xuất dữ liệu hiệu quả.

## Ngôn ngữ CSDL
- **DDL**: Ngôn ngữ định nghĩa cấu trúc dữ liệu (tạo bảng, cột...).
- **DML**: Ngôn ngữ thao tác dữ liệu (SELECT, INSERT INTO...).
- **DCL**: Ngôn ngữ kiểm soát dữ liệu (phân quyền user).
- **TCL**: Ngôn ngữ kiểm soát giao dịch.

## Người dùng CSDL
- **Database User**: Người thao tác, truy cập và sử dụng dữ liệu theo mức quyền được cấp.
- **DBA (Database Administrators)**:
  - Chịu trách nhiệm cấp quyền truy cập, giám sát tài nguyên hệ thống.
  - Sẵn sàng phục hồi dữ liệu khi xảy ra sự cố, chẩn đoán và bảo trì hệ thống.
- **Database Designer**: Thiết kế cơ sở dữ liệu và các ràng buộc dữ liệu.
- **End User**: Người dùng cuối, sử dụng dữ liệu qua ứng dụng/UI dựa trên CSDL.

---

# Chương 2: Cấu trúc lưu trữ

## Cấu trúc của ổ đĩa
- **Track**: Các vòng tròn đồng tâm trên mặt đĩa.
- **Sector**: Các phần nhỏ được chia từ track.
- **Cylinder**: Tập hợp các vòng tròn đồng tâm nằm cùng vị trí thẳng đứng trên các đĩa khác nhau.

## Các yếu tố ảnh hưởng đến truy xuất dữ liệu
- **Vật liệu lưu trữ**: Ảnh hưởng 70-80% tốc độ truy xuất (SSD nhanh hơn HDD).
- **Tốc độ quay của đĩa**: Tốc độ cao thì truy xuất nhanh hơn, và ngược lại.
- **Seek Time**: Thời gian đầu đọc di chuyển đến track.
- **Rotational Latency**: Thời gian chờ đĩa quay đến sector.
- **Cấu trúc dữ liệu lưu trữ**: Dữ liệu liên tục truy xuất nhanh hơn dữ liệu phân mảnh.

## Mẫu tin
- **Unspanned**: Dữ liệu lưu trữ trong một block, không bị chia cắt.
- **Spanned**: Mẫu tin vượt kích thước block, được chia để lưu trữ trong nhiều block.

## RAID
- Tập hợp các đĩa thành một đĩa duy nhất, tăng hiệu suất và sửa lỗi.
- **RAID 0**: 
  - Gộp từ 2-n đĩa, dữ liệu trải đều, tăng hiệu suất đọc/ghi, không dự phòng, hỏng một đĩa mất toàn bộ dữ liệu.
- **RAID 1**: 
  - Đĩa giống nhau, dữ liệu sao chép, tốc độ ghi chậm, chịu lỗi cao, một đĩa hỏng vẫn hoạt động.
- **RAID 5**: 
  - Từ 3-n đĩa, dự phòng trên một đĩa, phân tán dữ liệu, tốc độ đọc tăng, ghi giảm, hỏng một đĩa vẫn phục hồi được.
- **RAID 10**: 
  - Từ 4-n đĩa (số chẵn), phân nửa ghi, phân nửa sao chép, kết hợp hiệu suất và chịu lỗi.

## Mạng lưu trữ SAN
- Mạng lưu trữ riêng biệt kết nối các thiết bị lưu trữ (ổ cứng).
- Gộp hệ thống dùng chung qua mạng riêng, dễ quản lý và mở rộng.

---

# Chương 3: Quản trị đối tượng CSDL trong SQL Server

## System Database

- **Master**  
  - Nơi lưu trữ các cấu hình hệ thống, thông tin khởi động, thông tin mô tả các database, danh sách login.

- **Tempdb**  
  - Nơi lưu trữ các bảng tạm và dữ liệu tạm thời.  
  - Được reset sạch sẽ mỗi lần database khởi động lại.

- **Model**  
  - Khuôn mẫu để tạo ra database trong hệ thống.  
  - Khi sửa đổi trong này, các database tạo sau sẽ mang đặc điểm mới (khuôn đúc).

- **Msdb**  
  - Có thể được cấu hình cho các tác vụ tự động như thông báo sau 23h, các job schedule.

## Tổ chức tập tin CSDL

- Mỗi database phải có ít nhất 1 data file và 1 log file.  
- **Data File**: Lưu trữ dữ liệu và các objects.  
- **Log File**: Ghi lại tất cả thay đổi của database, hỗ trợ hiệu quả trong quá trình phục hồi dữ liệu khi có sự cố.  
- **Primary Data File**:  
  - Lưu trữ dữ liệu gốc (bảng, thông tin khởi động).  
  - Mỗi database có một file này, đuôi mở rộng `.mdf`.  
- **Secondary Data File**:  
  - Phần mở rộng `.ndf`, có thể có hoặc không.  
  - Dùng để mở rộng dữ liệu bổ sung cho primary file, trải dữ liệu giúp truy vấn nhanh hơn.  
- **Transaction Log File**:  
  - Ghi lại nhật ký giao dịch trong database, phục hồi dữ liệu khi có sự cố.  
  - Phải có ít nhất một log file, đuôi mở rộng `.ldf`.  
- **Filegroups**:  
  - Chứa các file `.mdf`, `.ndf`, dùng để quản lý các file vật lý.  
  - Chia nhỏ dữ liệu để dàn trải trên các RAID khi database quá lớn, tăng tốc độ truy vấn.  
  - **Primary Filegroup**:  
    - Chứa primary data files, system tables và các file không đặt vào filegroup khác.  
    - **System Tables**: Các table do SQL Server tự động tạo khi tạo database.

- **Chế độ Automatic Filegrowth**:  
  - Chế độ tự động tăng kích thước file lưu trữ.  
  - Mỗi lần tạo file có kích thước cố định, khi đạt giới hạn sẽ tự động tăng đến khi đầy ổ lưu trữ.  
  - Giúp giảm gánh nặng cho người quản trị CSDL.



- **Collation**: 

| Collation | Phân biệt hoa thường | Phân biệt có giấu | Ví dụ             |
| --------- | -------------------- | ----------------- | ----------------- |
| `CI_AS `| `Không`| `Có`                | `DũNG , Dũng`       |
| `CI_AI`     | `Không`                | `Không`             | `Dũng ,DUng , DŨNG `|
| `CS_AS`     | `Có`                   |` Có `               | `Dũng ` |
|`CS_AI`    | `Có `                  | `Không `            | `Dũng ,Dung` |

  - Cú pháp:  
    ```sql
    SELECT * FROM sinhvien WHERE ten LIKE 'Du%' COLLATE Latin1_General_CI_AS
    ```
    
## Các loại table đặc biệt

### temporary table bảng tạm
- Là bảng chỉ lưu dữ liệu tạm thời trong quá trình xử lý.
- Dữ liệu được lưu trong `tempdb`.
- Cách tạo:
  - Cách 1: 
    ```sql
    CREATE TABLE #NhanVien (
      manv CHAR(4),
      tennv NVARCHAR(100)
    );
    ```
  - Cách 2:
    ```sql
    SELECT manv, tennv INTO #nvp1 FROM nhanvien WHERE manv = '001';
    ```

### CTE common table expression
- Là bảng tạm thời trong câu truy vấn.
- Tồn tại trong suốt thời gian của câu truy vấn.
- Giúp tách nhỏ câu truy vấn phức tạp, hỗ trợ đệ quy.
- Cú pháp:
  ```sql
  WITH nameCTE AS (
    body CTE
  )
  SELECT * FROM nameCTE;
  ```
- Ví dụ:
  ```sql
  WITH nhanvientenA AS (
    SELECT * FROM nhanvien WHERE ten LIKE 'A%'
  )
  SELECT * FROM nhanvientenA;
  ```

### 📦 Memory-Optimized Tables
- Bảng lưu trữ trong bộ nhớ RAM để tăng hiệu suất.
- Một bản sao lưu vẫn được lưu trên ổ cứng để bảo vệ dữ liệu.
- Ví dụ:
  ```sql
  ALTER DATABASE QLSV ADD FILEGROUP QUANLYSINHVIEN CONTAINS MEMORY_OPTIMIZED_DATA;
  ALTER DATABASE QLSV ADD FILE (
    NAME = 'QUANLYSV',
    FILENAME = 'E:\\QLSV\\QUANLY.MDF'
  ) TO FILEGROUP QUANLYSINHVIEN;

  CREATE TABLE LOPHOC (
    ID INT PRIMARY KEY NONCLUSTERED,
    TENLOP CHAR(10)
  ) WITH (MEMORY_OPTIMIZED = ON);
  ```

### 📦 Partitioned Tables
- Phân mảnh dữ liệu ngang, lưu vào nhiều filegroup khác nhau.
- Giúp quản lý dữ liệu hiệu quả và đảm bảo toàn vẹn.
- Các bước:
  ```sql
  ALTER DATABASE QLSV ADD FILEGROUP GR_LOPTH01;
  ALTER DATABASE QLSV ADD FILEGROUP GR_LOPTH02;
  ALTER DATABASE QLSV ADD FILEGROUP GR_LOPTH03;
  ALTER DATABASE QLSV ADD FILEGROUP GR_LOPTH04;

  ALTER DATABASE QLSV ADD FILE (NAME = 'LOPTH01', FILENAME = 'E:\\QLSV\\LOPTH01.ndf') TO FILEGROUP GR_LOPTH01;
  ALTER DATABASE QLSV ADD FILE (NAME = 'LOPTH02', FILENAME = 'E:\\QLSV\\LOPTH02.ndf') TO FILEGROUP GR_LOPTH02;
  ALTER DATABASE QLSV ADD FILE (NAME = 'LOPTH03', FILENAME = 'E:\\QLSV\\LOPTH03.ndf') TO FILEGROUP GR_LOPTH03;
  ALTER DATABASE QLSV ADD FILE (NAME = 'LOPTH04', FILENAME = 'E:\\QLSV\\LOPTH04.ndf') TO FILEGROUP GR_LOPTH04;

  CREATE PARTITION FUNCTION pf_LOPHOC(INT)
  AS RANGE LEFT FOR VALUES (1,2,3);

  CREATE PARTITION SCHEME ps_LOPHOC
  AS PARTITION pf_LOPHOC TO (GR_LOPTH01, GR_LOPTH02, GR_LOPTH03, GR_LOPTH04);

  CREATE TABLE SINHVIEN (
    ID INT IDENTITY NOT NULL,
    TENSV VARCHAR(100) NOT NULL,
    DTB FLOAT NULL,
    MALOP INT NOT NULL
  ) ON ps_LOPHOC(MALOP);

  CREATE CLUSTERED INDEX idxLOPHOC ON SINHVIEN(MALOP)
  ON ps_LOPHOC(MALOP);
  ```

### 📦 Temporal Tables
- Bảng hỗ trợ lưu trữ lịch sử thay đổi tự động.
- Cứ mỗi lần thay đổi, dữ liệu cũ được lưu lại.
- Ví dụ:
  ```sql
  CREATE TABLE NVien (
    MSNV CHAR(4) PRIMARY KEY CLUSTERED,
    HoTen NVARCHAR(20),
    MSPB CHAR(2),
    Luong INT,
    ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START,
    ValidTo DATETIME2 GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
  )
  WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.NVienHistory));
  ```

---

### View

- **Standard View**: bảng ảo, không chứa dữ liệu thực.
- Công dụng: che giấu sự phức tạp truy vấn, tạo truy vấn trung gian.

Ví dụ:
```sql
CREATE VIEW SINHVIENLOP_1 AS
SELECT * FROM SINHVIEN WHERE MALOP = 1
WITH CHECK OPTION;

SELECT * FROM SINHVIENLOP_1;
```

---

### Index

| Loại Index | Giải thích chi tiết | Ví dụ |
|:---|:---|:---|
| Dense Index | Cứ mỗi giá trị khóa đều có một record trong index. | Cứ 1000 dòng → Dense Index cũng chứa 1000 dòng. |
| Sparse (Non-Dense) Index | Chỉ lưu vài giá trị đại diện, tiết kiệm bộ nhớ. | Lưu điểm mốc mỗi 10 dòng. |
| Primary Index | Tạo trên khóa chính, bản ghi sắp xếp theo khóa chính. | Bảng SinhVien theo MSV. |
| Clustering Index | Sắp xếp vật lý dữ liệu theo giá trị có thể trùng. | Hoá đơn theo NgàyHD. |
| Secondary Index | Không thay đổi vật lý dữ liệu, tạo bảng tra cứu nhanh. | Index phụ trên tên nhân viên. |


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


