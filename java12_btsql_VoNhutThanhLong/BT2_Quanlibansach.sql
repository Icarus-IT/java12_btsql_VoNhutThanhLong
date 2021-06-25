CREATE DATABASE db_QLBanSach;
USE db_QLBanSach;
CREATE TABLE IF NOT EXISTS Khach_hang(
	MaKH varchar(10) PRIMARY KEY NOT NULL,
    TaiKhoan varchar(50)  NOT NULL,
    MatKhau varchar(50)  NOT NULL,
    Email varchar(50)  NOT NULL,
    DiaChi nvarchar(255)  NOT NULL,
    DienThoai varchar(10)  NOT NULL,
    GioiTinh nvarchar(50)  NOT NULL,
    NgaySinh date  NOT NULL,
    HoTen nvarchar(50)  NOT NULL
);
CREATE TABLE IF NOT EXISTS Don_hang(
	MaDonHang varchar(10) PRIMARY KEY NOT NULL,
    DaThanhToan bit,
    TinhTrangGH nvarchar(255),
    NgayDat date,
    NgayGiao date,
    MaKH VARCHAR(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS Tac_gia(
	MaTacGia varchar(10) PRIMARY KEY NOT NULL,
    TenTacGia nvarchar(50),   
    DiaChi nvarchar(255),
    TieuSu nvarchar(255),
    DienThoai varchar(10)     
);

CREATE TABLE IF NOT EXISTS Chu_de(
	MaChuDe varchar(10) PRIMARY KEY NOT NULL,
    TenChuDe nvarchar(50)
);

CREATE TABLE IF NOT EXISTS Sach(
	MaSach varchar(10) PRIMARY KEY NOT NULL ,
    TenSach nvarchar(50),
    GiaBan float UNSIGNED NULL DEFAULT NULL,
    MoTa nvarchar(255),
    AnhBia varchar(255),
    NgayCapNhat date,
    SoLuongTon int UNSIGNED NULL DEFAULT NULL,
    MaChuDe VARCHAR(10) NOT NULL,
    MaNSX VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS Nha_xuat_ban(
 MaNSX varchar(10) PRIMARY KEY NOT NULL,
 TenNSB nvarchar(50),
 DiaChi varchar(255),
 DienThoai varchar(10)
);


CREATE TABLE IF NOT EXISTS Chi_tiet_don_hang(
 MaChiTiet varchar(10) PRIMARY KEY NOT NULL,
 SoLuong int UNSIGNED NOT NULL,
 DonGia float UNSIGNED NOT NULL,
 MaDonHang varchar(10) NOT NULL,
 MaSach varchar(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS Chi_tiet_tac_gia(
 MaChiTiet varchar(10) PRIMARY KEY NOT NULL,
 VaiTro nvarchar(50),
 ViTri nvarchar(50),
 MaTacGia varchar(10)  NOT NULL,
 MaSach varchar(10) NOT NULL 
);


ALTER TABLE Don_hang
ADD FOREIGN KEY (MaKH) 
REFERENCES Khach_hang(MaKH);

ALTER TABLE Sach
ADD FOREIGN KEY (MaChuDe) 
REFERENCES Chu_de(MaChuDe);

ALTER TABLE Sach
ADD FOREIGN KEY (MaNSX) 
REFERENCES Nha_xuat_ban(MaNSX);

ALTER TABLE Chi_tiet_don_hang
ADD FOREIGN KEY (MaDonHang) 
REFERENCES Don_hang(MaDonHang);
ALTER TABLE Chi_tiet_don_hang
ADD FOREIGN KEY (MaSach) 
REFERENCES Sach(MaSach);

ALTER TABLE Chi_tiet_tac_gia
ADD FOREIGN KEY (MaTacGia) 
REFERENCES Tac_gia(MaTacGia);
ALTER TABLE Chi_tiet_tac_gia
ADD FOREIGN KEY (MaSach) 
REFERENCES Sach(MaSach);


INSERT INTO `db_qlbansach`.`khach_hang` (`MaKH`, `TaiKhoan`, `MatKhau`, `Email`, `DiaChi`, `DienThoai`, `GioiTinh`, `NgaySinh`, `HoTen`) VALUES ('1', 'user01', '123', 'user1@gmail.com', 'Q9', '0123456789', 'Nam', '2000-10-16', 'Long');
INSERT INTO `db_qlbansach`.`khach_hang` (`MaKH`, `TaiKhoan`, `MatKhau`, `Email`, `DiaChi`, `DienThoai`, `GioiTinh`, `NgaySinh`, `HoTen`) VALUES ('002', 'user02', '123', 'user2@gmail.com', 'Q9', '0123331212', 'Nam', '2000-10-10', 'Long');
INSERT INTO `db_qlbansach`.`khach_hang` (`MaKH`, `TaiKhoan`, `MatKhau`, `Email`, `DiaChi`, `DienThoai`, `GioiTinh`, `NgaySinh`, `HoTen`) VALUES ('003', 'user03', '123', 'user3@gmail.com', 'Q9', '0123456789', 'Nu', '2001-01-03', 'Lieu');
INSERT INTO `db_qlbansach`.`khach_hang` (`MaKH`, `TaiKhoan`, `MatKhau`, `Email`, `DiaChi`, `DienThoai`, `GioiTinh`, `NgaySinh`, `HoTen`) VALUES ('004', 'admin', '123', 'admin1@gmail.com', 'HCM', '9876543210', 'Nam', '2003-02-02', 'Long');
INSERT INTO `db_qlbansach`.`khach_hang` (`MaKH`, `TaiKhoan`, `MatKhau`, `Email`, `DiaChi`, `DienThoai`, `GioiTinh`, `NgaySinh`, `HoTen`) VALUES ('005', 'admin', '123', 'admin2@gmail.com', 'HCM', '3216549870', 'Nam', '2000-01-01', 'Ly');
INSERT INTO `db_qlbansach`.`chu_de` (`MaChuDe`, `TenChuDe`) VALUES ('1', 'Toan');
INSERT INTO `db_qlbansach`.`chu_de` (`MaChuDe`, `TenChuDe`) VALUES ('2', 'Van');
INSERT INTO `db_qlbansach`.`chu_de` (`MaChuDe`, `TenChuDe`) VALUES ('3', 'Hoa');

INSERT INTO `db_qlbansach`.`nha_xuat_ban` (`MaNSX`, `TenNSB`, `DiaChi`, `DienThoai`) VALUES ('1', 'Kim Dong', 'HCm', '0123321123');
INSERT INTO `db_qlbansach`.`nha_xuat_ban` (`MaNSX`, `TenNSB`, `DiaChi`, `DienThoai`) VALUES ('2', 'Dong Kin', 'HCM', '9876543210');
INSERT INTO `db_qlbansach`.`sach` (`MaSach`, `TenSach`, `GiaBan`, `MoTa`, `AnhBia`, `NgayCapNhat`, `SoLuongTon`, `MaChuDe`, `MaNSX`) VALUES ('1', 'Toan', '2000', 'IQ', 'toan.jpg', '2020-01-01', '20', '1', '1');
INSERT INTO `db_qlbansach`.`sach` (`MaSach`, `TenSach`, `GiaBan`, `MoTa`, `AnhBia`, `NgayCapNhat`, `SoLuongTon`, `MaChuDe`, `MaNSX`) VALUES ('2', 'Van', '2000', 'De ngu', 'van.jpg', '2020-01-01', '30', '2', '1');
INSERT INTO `db_qlbansach`.`sach` (`MaSach`, `TenSach`, `GiaBan`, `MoTa`, `AnhBia`, `NgayCapNhat`, `SoLuongTon`, `MaChuDe`, `MaNSX`) VALUES ('3 ', 'Toan Casio', '5000', 'IQ', 'casio.jpg', '2020-02-02', '25', '1', '1');
INSERT INTO `db_qlbansach`.`sach` (`MaSach`, `TenSach`, `GiaBan`, `MoTa`, `AnhBia`, `NgayCapNhat`, `SoLuongTon`, `MaChuDe`, `MaNSX`) VALUES ('4', 'Vo Nhat', '3000', 'Lang mang', 'vonhat.jpg', '2020-03-01', '35', '2', '2');
INSERT INTO `db_qlbansach`.`don_hang` (`MaDonHang`, `DaThanhToan`, `TinhTrangGH`, `NgayDat`, `NgayGiao`, `MaKH`) VALUES ('1', b'0', 'chua nhan', '2020-05-05', '2020-05-06', '1');
INSERT INTO `db_qlbansach`.`don_hang` (`MaDonHang`, `DaThanhToan`, `TinhTrangGH`, `NgayDat`, `NgayGiao`, `MaKH`) VALUES ('2', b'0', 'chua nhan', '2020-05-05', '2020-05-06', '1');
INSERT INTO `db_qlbansach`.`don_hang` (`MaDonHang`, `DaThanhToan`, `TinhTrangGH`, `NgayDat`, `NgayGiao`, `MaKH`) VALUES ('3', b'0', 'chua nhan', '2020-04-04', '2020-04-05', '002');
INSERT INTO `db_qlbansach`.`don_hang` (`MaDonHang`, `DaThanhToan`, `TinhTrangGH`, `NgayDat`, `NgayGiao`, `MaKH`) VALUES ('4', b'1', 'da nhan', '2020-05-05', '2020-05-05', '003');
INSERT INTO `db_qlbansach`.`tac_gia` (`MaTacGia`, `TenTacGia`, `DiaChi`, `TieuSu`, `DienThoai`) VALUES ('1', 'Nam Cao', 'Q3', 'Khong ro', '0101010101');
INSERT INTO `db_qlbansach`.`tac_gia` (`MaTacGia`, `TenTacGia`, `DiaChi`, `TieuSu`, `DienThoai`) VALUES ('2', 'Nguyen Binh', 'Q9', 'khong ro', '000000000');
INSERT INTO `db_qlbansach`.`tac_gia` (`MaTacGia`, `TenTacGia`, `DiaChi`, `TieuSu`, `DienThoai`) VALUES ('3', 'To Huu', 'Q3', 'Khong ro', '1234566540');
INSERT INTO `db_qlbansach`.`tac_gia` (`MaTacGia`, `TenTacGia`, `DiaChi`, `TieuSu`, `DienThoai`) VALUES ('4', 'NXB Kim Dong', 'Q3', 'Khong ro', '1233211230');
INSERT INTO `db_qlbansach`.`chi_tiet_don_hang` (`MaChiTiet`, `SoLuong`, `DonGia`, `MaDonHang`, `MaSach`) VALUES ('1', '2', '4000', '1', '1');
INSERT INTO `db_qlbansach`.`chi_tiet_don_hang` (`MaChiTiet`, `SoLuong`, `DonGia`, `MaDonHang`, `MaSach`) VALUES ('2', '3', '6000', '2', '4');
INSERT INTO `db_qlbansach`.`chi_tiet_tac_gia` (`MaChiTiet`, `VaiTro`, `ViTri`, `MaTacGia`, `MaSach`) VALUES ('1', 'Bien tap', 'Chu bien', '1', '1');
INSERT INTO `db_qlbansach`.`chi_tiet_tac_gia` (`MaChiTiet`, `VaiTro`, `ViTri`, `MaTacGia`, `MaSach`) VALUES ('2', 'Pho bien tap', 'Pho bien', '2', '1');
