## Các đặc điểm của mô hình DBMS
- trừu tượng hóa dữ liệu
(data model) chỉ hiển thị mô hình vật lý ở mức ý niệm 
- (multiple views) hỗ trợ user nhiều góc nhìn khác nhau
- chia sẻ dữ liệu và xử lý đồng thời nhiều người dùng
 cho phép truy cập đồng thời 
 ## ngôn ngữ định nghĩa dữ liệu - (Data Definition Language - DDL)
cho phép xác định sơ đồ bằng đặc tả dư liệu (data dictionary)
## ngôn ngữ thao tác dữ liệu - Data Manipulation Language - DML
- cho phép thao tác dữ liệu như truy vấn (query), insert, delete
## phân loại End-Users
- Casuel : thỉnh thoảng truy cập khi cần 
- naive : nhóm đông nhất m sử dụng các chức năng đặt sẵn ví dụ như nhân viên bán hàng 
- Sophisticated: các kĩ sư, phân tích viên 
- tand-alone : người dùng máy tính cá nhân để thao tác với csdl
## trách nhiệm của DBA 
1 - bảo mật 
    mối user có những quyền gì, chức năng gì
    xác thực như thế nào
2 - đọ sẵn sàng cao
    đảm bảo luôn sẵn sàng hoạt động khi có sự cố sảy ra
3 - độ tin cậy
    chuẩn đoán và bảo chì hệ thống 
    phát hiện các sự cố tiềm ẩn 
4 - khả năng phục hồi 
    phục hồi càng nhanh càng tốt khi gặp sự cố 
#### II tổ chức CSDL
# các tác vụ trên tập tin 
1 - tác vụ truy xuất 
    truy xuất dl. không thay đổi dữ liệu 
2- các tác vụ cập nhật
    thay đổi dữ liệu, chèn xóa, hiệu chỉnh 
# cấu hình đĩa sẽ ảnh hưởng lớn đến hiệu xuất của CSDL
## RAID - Redundant Array of Inexpensive Disks
 - là một tập hợp các đĩa con lại với nhau thành một đĩa duy nhất dưới góc độ người dùng 
 - được dùng để tăng hiệu xuất , sửa chữa lỗi 
 - có nhiều mức raid khác nhau nên chọn các mức phù hợp với CSDL
    # RAID 0
    - 2 đến n địa gộp lại, các bit đc trải ra tất cả các địa , tăng hiệu xuất đọc ghi và tối đa hóa song song
    - không chưa dữ liệu trùng lặp 
    ? một dĩa bị hỏng là toàn bộ dữ liệu cũng đi theo 
    # RAID 1 ( Mirror)
    - 2 đĩa dữ liêu giống hệt nhau, khi ghi vào dĩa , hệ thống sẽ tự động ghi vào đĩa còn lại => tốc dộ ghi chậm => tốc độ đọc tăng ( đọc từ hai đĩa )
    - tính chịu lỗi cao 
    # RAID 5 
    - 3 đến n đĩa , tạo trùng lặp trên một dĩa trong dãy đĩa, dữ liệu trải  trên nhiều đĩa nên tốc độ đọc tăng
    - tốc độ ghi trậm do phải kiểm tra phân bổ 
    - một ổ bị hỏng vẫn có thể tái tạo lại 
    # RAID 10
    - 4 đến n đĩa SỐ LƯỢNG ĐĨA LUÔN LÀ SỐ CHẴN  
    - các bít trải trên phân nửa số đĩa và đc copy sang phân nửa còn lại 
    - sự kết hợp giữa RAID 1 and RAID 0
## Phân biệt NAS và SAN
    - điều là hai loại mạng lưu trữ phổ biến nhất hiện nay 
    ▪ Cách kết nối:
        NAS kết nối storage với máy chủ qua mạng LAN, còn
        SAN kết nối storage với máy chủ qua mạng riêng biệt
    # Ưu nhược điểm:
        ▪ NAS có ưu điểm là dễ triển khai, dễ sử dụng và ít tốn
        chi phí, nhưng có nhược điểm là hiệu suất thấp, khả
        năng mở rộng hạn chế và an toàn kém.
        ▪ SAN có ưu điểm là hiệu suất cao, khả năng mở rộng
        lớn và an toàn tốt, nhưng có nhược điểm là khó triển
        khai, khó sử dụng và tốn chi phí.
#### DATABASE IN SQL SERVER
# Data file 
    lưu dữ liệu , đối tượng objects, tables indexes
    kích thước tối đa 32 terabyte (TB)
# Log file 
    lưu thông tin transaction log 
    mỗi database có ít nhất 1 dt file and 1 log file
    kích thước tôi đa 4 TB
# Ptimary data file
    chứa thông tin khởi động của dâtbase
    chưa con trỏ đến cac file còn lại trong db
    mối db có đúng một primary file có phần mở rộng mặc định .mdf
# secondary data file
    có thể có hoặc không 
    phần mở rộng .ndf
# Transaction log files
    mỗi db có ít nhất một log file phần mở rộng .ldf
#### Quản trị đối tượng CSDL

- có 4 db hệ thống khi đc tạo ra khi cài đặt
  # Master
    lưu thông tin của hệ thống : tt khởi động, cấu hình, login accounts
  # Tempdb
    giữ table tạm (temporary tables) và thủ tục lưu trữ tạm 
  # Model
    dùng như khuôn mẫu cho tất cả các db tạo ra trong hệ thống , nếu sửa trong này thì khi tạo ra các db mới đều thay đổi
  # Msdb
    giữ các table mà SQL Server Agent dùng để ffinh thời cho các job và cảnh báo cho tác vụ

# Table
    dùng để lưu trữ dữ liệu trong 1 bảng 2 chiều 
    Đặt tên : không khoảng trắng không viết tắt ,có ý nghĩa ,số ít

```SQL
# kiểu dữ liệu 
TINYINT 0 -> 255
SMALLINT 2 byte
int 4 byte
bigint 8 byte
...
bit  0 || 1
binary dữ liệu nhị phân cố định
varbinary nhị phân thay đổi
VARBINARY(MAX) để lưu ảnh ,file
XML
JSON
 
--   CÁC LOẠI RÀNG BUỘC
____________________________________________________________________________________
PRIMARY KEY | (KHÓA CHÍNH) ĐỊNH DANH DUY NHẤT CHO DÒNG , NOT NULL ,KHÔNG TRÙNG
FOREIGN KEY | LIÊN KẾT GIỮA HAI BẢNG (KHÓA NGOẠI)
UNIQUE  | ĐẢM BẢO DỮ LIỆU TRONG CỘT LÀ DUY NHẤT
CHECK   | ĐẶT ĐIỀU KIỆN CHO DỮ LIỆU ĐẦU VÀO
DEFAULT | CUNG CẤP GIÁ TRỊ MẶC ĐỊNH KHI KHÔNG NHẬP GÌ
--KHÓA CHÍNH
"MỖI BẢNG CÓ MỘT KHÓA CHÍNH VD"
CREATE TABLE SinhVien(
    MaSV INT PRIMARY KEY NOT NULL,
    HoTen NVARCHAR(100),
    NgaySinh DATETIME
);
"NẾU BẢNG ĐÃ CÓ MÀ CHƯA CÓ KHÓA CHÍNH"
ALTER TABLE SinhVien ADD CONSTRAINT KEY PK_SinhVien PRIMARY KEY (MaSV);
--KHÓA NGOẠI
"khóa ngoại khi tạo bảng"
GO
CREATE TABLE LopHoc(
    MaLop CHAR(10) NOT NULL,
    TenLop NVARCHAR(50)
);
GO
CREATE TABLE SinhVien(
    MaSV INT PRIMARY KEY NOT NULL,
    HoTen NVARCHAR(100),
    NgaySinh DATETIME,
    MaLop NVARCHAR(50) FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop)
);
"TẠO LIÊN KẾT KHI ĐÃ TẠO BẢNG"
ALTER TABLE SinhVien ADD CONSTRAINT KEY FK_SINHVIEN_LOPHOC FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop);
GO
"XÓA RÀNG BUỘC KHÓA NGOẠI"
ALTER TABLE SinhVien DROP CONSTRAINT FK_SINHVIEN_LOPHOC;
GO
--RÀNG BUỘC UNIQUE KHÔNG TRÙNG LẶP , CÓ THỂ NULL
CREATE TABLE NHANVIEN(
    MaNV INT PRIMARY KEY NOT NULL,
    Email NVARCHAR(100) UNIQUE
);
GO
"THÊM RÀNG BUỘC KHI BẢNG ĐÃ TẠO"
ALTER TABLE NHANVIEN ADD CONSTRAINT UQ_NHANVIEN_EMAIL UNIQUE (Email);
GO
"XÓA RÀNG BUỘC"
ALTER TABLE NHANVIEN DROP CONSTRAINT UQ_NHANVIEN_EMAIL;
GO
-- RÀNG BUỘC NOT NULL

-- dùng để xem thông tin chi tiết của DB
exec sp_helpdb 'Testdb'


```



 