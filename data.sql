CREATE DATABASE QuanLyGarage1
GO

USE QuanLyGarage1
GO

--KHACHHANG
---XE
--hieuxe
--phieusuachua
--phieuthutien
---chitietphieusuachua
---phutung
--TIENCONG
--TaiKhoan
--thamso
--CHITIEIBAOCAOTON
--CHITIETBAOCAODOANHSO(BỎ)
---thangnam
--PHIEUNHAPVTPT



CREATE TABLE KHACHHANG
(
	
	[MaKH] [int] NOT NULL,
    [TenKH] [varchar](30) NULL,
    [DienThoai] [varchar](10) NULL,
    [DiaChi] [varchar](100) NULL,
    [TienNo] [int] NULL,
	PRIMARY KEY CLUSTERED ([MaKH] ASC) 
)
GO

CREATE TABLE XE
(
	[BienSo] [varchar](10) NOT NULL,
    [MaHX] [int] NULL,
    [MaKH] [int] NULL,
    [NgayTiepNhan] [datetime] NULL,
    [TrangThai] [int] NULL,
	PRIMARY KEY CLUSTERED ([BienSo] ASC)
)
GO

CREATE TABLE HIEUXE
(
	[MaHX] [int] NOT NULL,
    [TenHieuXe] [varchar](30) NULL,
	PRIMARY KEY CLUSTERED ([MaHX] ASC)
)
GO

CREATE TABLE PHIEUSUACHUA
(
	[MaPhieuSuaChua] [int] NOT NULL,
    [BienSo] [varchar](10) NULL,
    [MaKH] [int] NULL,
    [TienCong] [int] NULL,
    [TienPhuTung] [int] NULL,
    [TongTien] [int] NULL,
	PRIMARY KEY CLUSTERED ([MaPhieuSuaChua] ASC)
)
GO

CREATE TABLE PHUTUNG
(
	[MaPhuTung] [int] NOT NULL,
    [TenVatTuPhuTung] [varchar](30) NULL,
    [SoLuong] [int] NULL,
    [DonGia] [int] NULL,
	PRIMARY KEY CLUSTERED ([MaPhuTung] ASC)
)
GO

CREATE TABLE CTPHIEUSUACHUA
(
	[MaPhieuSuaChua] [int] NULL,
    [MaTC] [int] NULL,
    [MaPhuTung] [int] NULL,
    [SoLuongPhuTung] [int] NULL
) ON [PRIMARY]

GO

CREATE TABLE TIENCONG
(
 [MaTC] [int] NOT NULL,
    [TenTienCong] [varchar](100) NULL,
    [ChiPhi] [int] NULL,
	PRIMARY KEY CLUSTERED ([MaTC] ASC)
)
GO

CREATE TABLE PHIEUTHUTIEN
(
	[MaPhieuThuTien] [int] NOT NULL,
    [MaKH] [int] NULL,
    [TienThu] [int] NULL,
    [NgayThuTien] [datetime] NULL,
	PRIMARY KEY CLUSTERED ([MaPhieuThuTien] ASC)
)
GO

CREATE TABLE BAOCAOTON
(
	[MaBCT] [int] NOT NULL,
    [ThoiDiemBaoCao] [datetime] NULL,
	PRIMARY KEY CLUSTERED ( [MaBCT] ASC)
)
GO

CREATE TABLE CT_BAOCAOTON
(
    [MaBCT] [int] NOT NULL,
    [MaPhuTung] [int] NOT NULL,
    [TonDau] [int] NULL,
    [PhatSinh] [int] NULL,
    [TonCuoi] [int] NULL,
	CONSTRAINT [pk_ctBCT] PRIMARY KEY CLUSTERED
(
    [MaBCT] ASC,
    [MaPhuTung] ASC
	)
)
GO

CREATE TABLE THAMSO
(
	[MaThamSo] [varchar](5) NOT NULL,
    [TenThamSo] [varchar](50) NULL,
    [GiaTri] [int] NULL,
	PRIMARY KEY CLUSTERED ([MaThamSo] ASC)
)
GO


CREATE TABLE PHIEUNHAPVTPT
(
    MaPNVTPT INT NOT NULL,
	MaPhuTung INT NULL,
	SoLuong INT NULL,
	ThoiDiem DATETIME NULL,
    PRIMARY KEY CLUSTERED (MaPNVTPT ASC)

)
GO

--tạo bảng TAIKHOAN
CREATE TABLE TAIKHOAN
(
   MaTK int NOT NULL,
   TenTaiKhoan VARCHAR(50),
   TenDangNhap VARCHAR(50),
   MatKhau VARCHAR(20),
   QuyenHan VARCHAR(50),
   PRIMARY KEY CLUSTERED (MaTK ASC)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [int] NOT NULL,
	[TenChuTaiKhoan] [varchar](20) NULL,
	[TenDangNhap] [varchar](20) NULL,
	[MatKhau] [varchar](20) NULL,
	[QuyenHan] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Tham chiếu khóa ngoại
ALTER TABLE CTPHIEUSUACHUA  WITH CHECK ADD FOREIGN KEY([MaPhieuSuaChua])
REFERENCES PHIEUSUACHUA ([MaPhieuSuaChua])
GO

ALTER TABLE CTPHIEUSUACHUA  WITH CHECK ADD FOREIGN KEY([MaPhuTung])
REFERENCES PHUTUNG ([MaPhuTung])
GO

ALTER TABLE CTPHIEUSUACHUA WITH CHECK ADD FOREIGN KEY([MaTC])
REFERENCES TIENCONG ([MaTC])
GO

ALTER TABLE CT_BAOCAOTON WITH CHECK ADD FOREIGN KEY([MaPhuTung])
REFERENCES PHUTUNG ([MaPhuTung])
GO

ALTER TABLE dbo.CT_BAOCAOTON WITH CHECK ADD FOREIGN KEY(MaBCT)
REFERENCES BAOCAOTON(MaBCT)
GO

ALTER TABLE PHIEUSUACHUA  WITH CHECK ADD FOREIGN KEY([BienSo])
REFERENCES XE([BienSo])
GO

ALTER TABLE PHIEUSUACHUA  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES KHACHHANG ([MaKH])
GO

ALTER TABLE PHIEUTHUTIEN WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES KHACHHANG ([MaKH])
GO

ALTER TABLE XE  WITH CHECK ADD FOREIGN KEY([MaHX])
REFERENCES HIEUXE ([MaHX])
GO

ALTER TABLE XE  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES KHACHHANG ([MaKH])
GO

ALTER TABLE PHIEUNHAPVTPT WITH CHECK ADD FOREIGN KEY(MaPNVTPT)
REFERENCES PHUTUNG (MaPhuTung)
GO


INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (0, N'Toyota')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (1, N'Kia')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (2, N'Mazda')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (3, N'Ford')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (4, N'Honda')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (5, N'Chevrolet')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (6, N'Mitsubishi')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (7, N'Suzuki')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (8, N'Isuzu')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (9, N'Mercedes')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (10, N'Lexus')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (11, N'Peugeot')
INSERT HIEUXE ([MaHX], [TenHieuXe]) VALUES (12, N'Audi')

INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (0, N'Guong chieu hau', 8, 3400000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (1, N'Den hau', 0, 1900000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (2, N'Den pha', 0, 3700000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (3, N'Kinh chan gio', 0, 1600000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (4, N'Nap binh xang', 0, 220000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (5, N'Binh xang', 9, 4800000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (6, N'Chan bun', 0, 1300000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (7, N'Lop xe', 8, 2000000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (8, N'Cam bien ABS', 0, 1500000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (9, N'Bugi', 0, 230000)
INSERT PHUTUNG ([MaPhuTung], [TenVatTuPhuTung], [SoLuong], [DonGia]) VALUES (10, N'Ken xe', 0, 240000)

INSERT THAMSO ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS1', N'So hieu xe', 10)
INSERT THAMSO ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS2', N'So xe sua chua toi da', 30)
INSERT THAMSO  ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS3', N'So loai vat tu', 200)
INSERT THAMSO  ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS4', N'So loai tien cong', 100)

INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (0, N'Thay guong chieu hau', 50000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (1, N'Thay den xe', 100000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (2, N'Thay kinh chan gio', 70000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (3, N'Thay binh xang', 150000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (4, N'Thay la chan bun', 60000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (5, N'Thay lop xe', 80000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (6, N'Gan cam bien ABS', 120000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (7, N'Thay bugi', 100000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (8, N'Thay ken xe', 90000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (9, N'Bom banh xe', 40000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (10, N'Ve sinh phu tung xe', 200000)
INSERT TIENCONG ([MaTC], [TenTienCong], [ChiPhi]) VALUES (11, N'Son xe', 5000000)

INSERT [dbo].[TAIKHOAN] ([MaTK], [TenChuTaiKhoan], [TenDangNhap], [MatKhau], [QuyenHan]) VALUES (02,N'Nguyen Thi Thu Ky', N'staff', N'1', N'Nhan vien')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenChuTaiKhoan], [TenDangNhap], [MatKhau], [QuyenHan]) VALUES (01, N'Nguyen Van Boss', N'boss', N'0', N'admin')
 SELECT *FROM dbo.TAIKHOAN

 /****** Object:  StoredProcedure [dbo].[USP_DangNhap]    Script Date: 6/24/2019 11:12:33 PM ******/
 SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [USP_DangNhap]
@TenDangNhap nvarchar(20),
@MatKhau nvarchar(20)
AS
BEGIN
	SELECT * FROM dbo.TAIKHOAN WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau
END
GO
--StoredProceduce Update Password

CREATE PROC [dbo].[UpdatePass]
	@MaTK int,
	@MatKhauMoi varchar(20)
AS
BEGIN
	UPDATE TAIKHOAN
	SET MatKhau = @MatKhauMoi 
	WHERE MaTK = @MaTK
END
GO

--StoredProceduce ThemKhachHang

CREATE PROC [dbo].[ThemKhachHang]
	@TenKH varchar(30),
	@DienThoai varchar(10),
	@DiaChi varchar(100),
	@TienNo int
AS
BEGIN
	DECLARE @test int
	SELECT @test=COUNT(MaKH) FROM KHACHHANG WHERE (@TenKH = TenKH) and (@DienThoai = DienThoai) 
	if @test = 0
	BEGIN
		DECLARE @imakh int
		select  @imakh = MAX(MaKH) from KHACHHANG
		IF (@imakh is null) set @imakh = 0
		else set @imakh = @imakh + 1			
		INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, DienThoai, TienNo) VALUES (@imakh, @TenKH, @DiaChi,@DienThoai, @TienNo)
	END
END;
GO

--StoredProceduce ThemXe
CREATE PROC [dbo].[ThemXe]
	@BienSo varchar(10) ,
	@HieuXe int,
	@MaKH int,
	@NgayTiepNhan datetime
AS
BEGIN
	INSERT INTO Xe (BienSo, MaHX, MaKH, NgayTiepNhan, TrangThai) VALUES (@BienSo, @HieuXe, @MaKH,@NgayTiepNhan, 1)
END;
GO
      /****** Object:  StoredProcedure [dbo].[TimKiemChinhXac]    Script Date: 7/11/2019 10:28:49 AM ******/

create proc [dbo].[TimKiemChinhXac]
	@BienSo varchar(10),
	@HieuXe varchar(30)
AS
BEGIN
	SELECT BienSo AS 'Biển số', TenHieuXe AS 'Tên hiệu xe', TenKH AS 'Tên khách hàng', DienThoai AS 'Điện thoại', DiaChi AS 'Địa chỉ', TienNo AS 'Tiền nợ'
	FROM XE, HIEUXE as HX, KHACHHANG as KH
	WHERE XE.MaHX = HX.MaHX and KH.MaKH = XE.MaKH and @BienSo = XE.BienSo and @HieuXe = HX.TenHieuXe 
END
GO
/****** Object:  StoredProcedure [dbo].[TimKiemTuongDoi]    Script Date: 7/11/2019 10:28:49 AM ******/

create proc [dbo].[TimKiemTuongDoi]
	@DuLieu varchar(100)
AS
BEGIN
	SELECT BienSo AS 'Biển số', TenHieuXe AS 'Tên hiệu xe', TenKH AS 'Tên khách hàng', DienThoai AS 'Điện thoại', DiaChi AS 'Địa chỉ', TienNo AS 'Tiền nợ'
	FROM XE, HIEUXE as HX, KHACHHANG as KH
	WHERE XE.MaHX = HX.MaHX and KH.MaKH = XE.MaKH and ((BienSo LIKE '%'+@DuLieu+'%') or (TenHieuXe LIKE '%'+@DuLieu+'%') or (TenKH LIKE '%'+@DuLieu+'%') or (DienThoai LIKE '%'+@DuLieu+'%') or (DiaChi LIKE '%'+@DuLieu+'%'))
END
GO
/****** Object:  StoredProcedure [dbo].[TongTienDoanhThu]    Script Date: 7/11/2019 10:28:49 AM ******/

create proc [dbo].[TongTienDoanhThu]
		@Thang int,
		@Nam int
AS
BEGIN
	select sum(PTT.TienThu)
	from PHIEUTHUTIEN as PTT
	WHERE Month(PTT.NgayThuTien) = @Thang and YEAR(PTT.NgayThuTien) = @Nam
END
GO

/****** Object:  StoredProcedure [dbo].[ThemPhieuThuTien]    Script Date: 7/11/2019 10:28:49 AM ******/


CREATE PROC [dbo].[ThemPhieuThuTien]
	@BienSo varchar(10),
	@TienThu int,
	@NgayThuTien datetime
AS
BEGIN
		DECLARE @imaptt int
		DECLARE @MaKH int
		SELECT @imaptt = COUNT(MaPhieuThuTien) from PHIEUTHUTIEN
		SET @imaptt = @imaptt + 1
		SELECT @MaKH = MaKH FROM XE WHERE XE.BienSo = @BienSo
		INSERT INTO PHIEUTHUTIEN (MaPhieuThuTien, MaKH, TienThu, NgayThuTien) VALUES (@imaptt, @MaKH, @TienThu, @NgayThuTien)
		UPDATE KHACHHANG SET TienNo = TienNo - @TienThu WHERE MaKH = @MaKH
		UPDATE XE SET TrangThai = 0 WHERE BienSo = @BienSo
END
GO

/****** Object:  StoredProcedure [dbo].[NhapMoiVTPT]    Script Date: 7/11/2019 10:28:49 AM ******/

create proc [dbo].[NhapMoiVTPT]
	@TenPhuTung varchar(30),
	@SoLuong int,
	@DonGia int,
	@ThoiDiem datetime
AS
BEGIN
	DECLARE @iMPNVTPT int
	SELECT @iMPNVTPT = COUNT(MaPNVTPT) FROM PHIEUNHAPVTPT
	SET @iMPNVTPT = @iMPNVTPT + 1
	DECLARE @iMVTPT int
	SELECT @iMVTPT = COUNT(MaPhuTung) FROM PHUTUNG
	SET @iMVTPT = @iMVTPT + 1
	INSERT INTO PHUTUNG (MaPhuTung, TenVatTuPhuTung, SoLuong, DonGia) VALUES (@iMVTPT, @TenPhuTung, @SoLuong, @DonGia)
	INSERT INTO PHIEUNHAPVTPT (MaPNVTPT, MaPhuTung, SoLuong, ThoiDiem) VALUES (@iMPNVTPT, @iMVTPT, @SoLuong, @ThoiDiem)
END
GO
/****** Object:  StoredProcedure [dbo].[NhapVTPT]    Script Date: 7/11/2019 10:28:49 AM ******/

create proc [dbo].[NhapVTPT]
	@MaPhuTung int,
	@SoLuong int,
	@ThoiDiem datetime
AS
BEGIN
	DECLARE @iMPNVTPT int
	SELECT @iMPNVTPT = COUNT(MaPNVTPT) FROM PHIEUNHAPVTPT
	SET @iMPNVTPT = @iMPNVTPT + 1
	INSERT INTO PHIEUNHAPVTPT (MaPNVTPT, MaPhuTung, SoLuong, ThoiDiem) VALUES (@iMPNVTPT, @MaPhuTung, @SoLuong, @ThoiDiem)
	UPDATE dbo.PHUTUNG SET SoLuong = SoLuong + @SoLuong WHERE MaPhuTung = @MaPhuTung
END
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoDoanhThu]    Script Date: 7/11/2019 10:28:49 AM ******/

create proc [dbo].[BaoCaoDoanhThu]
		@Thang int,
		@Nam int
AS
BEGIN
	select HX.TenHieuXe AS 'Tên Hiệu Xe', COUNT(PSC.MaPhieuSuaChua) as 'Số Lượt Sửa', SUM(PTT.TienThu) as 'Chi Phí', (COUNT(PSC.MaPhieuSuaChua)*100/(SELECT Count(*) FROM  PHIEUTHUTIEN as PTT, PHIEUSUACHUA as PSC where  PTT.MaKH = PSC.MaKH and Month(PTT.NgayThuTien) = @Thang and YEAR(PTT.NgayThuTien) = @Nam) ) as 'Tỉ Lệ'
	FROM KHACHHANG as KH, XE, HIEUXE as HX, PHIEUTHUTIEN as PTT, PHIEUSUACHUA as PSC
	WHERE KH.MaKH = XE.MaKH and XE.MaHX = HX.MaHX and PTT.MaKH = KH.MaKH and PSC.BienSo = Xe.BienSo and Month(PTT.NgayThuTien) = @Thang and YEAR(PTT.NgayThuTien) = @Nam
	Group by HX.TenHieuXe
END
GO

SELECT *FROM dbo.XE
