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
```

## Kiểm tra thông tin database

```sql
EXEC sp_helpdb 'Testdb';
```

---

**📌 Ghi chú:** Đây là bản cập nhật chuẩn hóa README.md giúp bạn dễ đọc và tra cứu hơn. 🚀

