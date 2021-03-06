USE [master]
GO
/****** Object:  Database [ShopMotoBike]    Script Date: 11/26/2021 10:35:02 AM ******/
CREATE DATABASE [ShopMotoBikes]
GO
USE [ShopMotoBikes]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 11/26/2021 10:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaHang] [int] NOT NULL,
	[MaDH] [int] NOT NULL,
	[SoLuongDat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/26/2021 10:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](60) NOT NULL,
	[MoTa] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/26/2021 10:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[DiaChiGiaoHang] [ntext] NOT NULL,
	[TinhTrangDH] [int] NOT NULL,
	[TongTien] [money] NULL,
	[MaTK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hang]    Script Date: 11/26/2021 10:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NOT NULL,
	[TenHang] [nvarchar](100) NOT NULL,
	[ThuongHieu] [nvarchar](50) NULL,
	[LoaiXe] [nvarchar](100) NULL,
	[GiaTien] [money] NOT NULL,
	[MoTaHang] [ntext] NULL,
	[MauSac] [nvarchar](50) NULL,
	[SoLuong] [int] NOT NULL,
	[Anh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/26/2021 10:35:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[TenDN] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[Quyen] [bit] NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[SoDienThoai] [varchar](10) NOT NULL,
	[Email] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (1, 1, 3)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (2, 1, 2)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (4, 1, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (3, 2, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (5, 4, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (14, 3, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (20, 5, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (30, 6, 1)
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (1, N'XE NHẬP KHẨU',N'HỆ THỐNG XE MÁY HOÀNG CẦU chuyên cung cấp các dòng xe Honda, Yamaha, SYM, Suzuki, xe nhập khẩu,.... chính hãng, cam kết mang đến những sản phẩm, phụ tùng chất lượng nhất đến tay người tiêu dùng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (2, N'HONDA',N'HỆ THỐNG XE MÁY HOÀNG CẦU chuyên cung cấp các dòng xe Honda, Yamaha, SYM, Suzuki, xe nhập khẩu,.... chính hãng, cam kết mang đến những sản phẩm, phụ tùng chất lượng nhất đến tay người tiêu dùng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (3, N'YAMAHA',N'HỆ THỐNG XE MÁY HOÀNG CẦU chuyên cung cấp các dòng xe Honda, Yamaha, SYM, Suzuki, xe nhập khẩu,.... chính hãng, cam kết mang đến những sản phẩm, phụ tùng chất lượng nhất đến tay người tiêu dùng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (4, N'SUZUKI',N'HỆ THỐNG XE MÁY HOÀNG CẦU chuyên cung cấp các dòng xe Honda, Yamaha, SYM, Suzuki, xe nhập khẩu,.... chính hãng, cam kết mang đến những sản phẩm, phụ tùng chất lượng nhất đến tay người tiêu dùng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (5, N'SYM',N'HỆ THỐNG XE MÁY HOÀNG CẦU chuyên cung cấp các dòng xe Honda, Yamaha, SYM, Suzuki, xe nhập khẩu,.... chính hãng, cam kết mang đến những sản phẩm, phụ tùng chất lượng nhất đến tay người tiêu dùng')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [DiaChiGiaoHang], [TinhTrangDH], [TongTien], [MaTK]) VALUES (1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), N'Phú Thọ',1,233000000.0000, 1)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [DiaChiGiaoHang], [TinhTrangDH], [TongTien], [MaTK]) VALUES (2, CAST(N'2021-08-09 00:00:00.000' AS DateTime), N'Nghệ An', 2, 36500000.0000, 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [DiaChiGiaoHang], [TinhTrangDH], [TongTien], [MaTK]) VALUES (3, CAST(N'2021-12-06 00:00:00.000' AS DateTime), N'Hải Dương', 3, 43000000.0000, 3)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [DiaChiGiaoHang], [TinhTrangDH], [TongTien], [MaTK]) VALUES (4, CAST(N'2021-03-07 00:00:00.000' AS DateTime), N'Ninh Bình', 2,39500000.0000,4)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [DiaChiGiaoHang], [TinhTrangDH], [TongTien], [MaTK]) VALUES (5, CAST(N'2021-07-05 00:00:00.000' AS DateTime), N'Bắc Giang', 1,18000000.0000, 5)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [DiaChiGiaoHang], [TinhTrangDH], [TongTien], [MaTK]) VALUES (6, CAST(N'2021-05-06 00:00:00.000' AS DateTime), N'Hà Nội', 0,33500000.0000, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[Hang] ON 

INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (1, 1, N'HONDA BEAT', N'NHẬP KHẨU', N'XE TAY GA', 35000000.0000,
N'-Sản phẩm có đèn trước với công nghệ LED thiết kế 3D bóng độc đáo đem lại cảm giác dũng mãnh và đầy tự tin
-Phong cách thiết kế đột phá với các đường nổi phá cách độc đáo và thanh thoát trên thân xe. Logo 3D "RSX" (trên phiên bản phanh đĩa vành đúc) kết hợp cùng tem chữ "sport" ấn tượng ở cả 3 phiên bản càng làm nổi bật lên một phong cách riêng chỉ có của Wave RSX.
-Thiết kế phía sau mang dáng vẻ vô cùng khỏe khoắn với cụm đèn hậu vuốt cao kiêu hãnh tăng thêm dấu ấn cá tính cho Wave RSX mới.
được trang bị động cơ 110cc, phun xăng điện tử, 4 kỳ, xi-lanh đơn, đáp ứng tiêu chuẩn khí thải Euro 3, tối ưu hóa khả năng tăng tốc, không những tiết kiệm nhiên liệu mà còn đảm bảo sự bền bỉ, vận hành mạnh mẽ và ổn định.
 được trang bị ổ khóa tích hợp bao gồm khóa điện, khóa từ, khóa cổ và khóa yên rất dễ sử dụng, an tâm hơn và chống rỉ sét.
-Hộc đựng đồ tiện lợi có khả năng chứa được 01 mũ bảo hiểm nửa đầu cùng những vật dụng cá nhân khác.',N'Đen', 0, N'xe1.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (2, 1, N'HONDA GENIO', N'NHẬP KHẨU', N'XE TAY GA', 36500000.0000,
N'Khối lượng bản thân 89 kg (Loại CBS), 90 kg (Loại CBS - ISS).
-Dài x Rộng x Cao 1869 x 692 x 1061 mm.
-Khoảng cách trục bánh xe 1,256 mm.
-Độ cao yên 740 mm.
-Khoảng sáng gầm xe 147 mm.
-Dung tích bình xăng 4,2 lít.
-Kích cỡ lốp trước/ sau: Trước: 80/90 - 14 M / C Không săm; Sau: 90/90 - 14 M / C Không săm.
-Loại động cơ PGM-FI, 4 – kỳ, SOHC, eSP.
-Dung tích xy-lanh 110cc.
-Đường kính x hành trình pít-tông 47,0 x 63,1 mm.
-Tỷ số nén 10,0 : 1.
-Công suất tối đa 6,6 kW / 7.500 vòng / phút.
-Mô-men cực đại 9,3 Nm / 5.500 vòng / phút.
-Hệ thống khởi động Điện.',N'Nâu Đen', 4, N'xe2.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (3, 1, N'HONDA SCOOPY', N'NHẬP KHẨU', N'XE TAY GA', 38500000.0000,
N'-Đèn chiếu sáng LED kiểu Projector và được bao quanh bởi dải đèn định vị hình oval.
-Scoopy được trang bị cụm phanh đĩa đơn ở bánh trước và phanh tang trống ở bánh sau.
-Hệ thống phanh của xe là loại phanh kết hợp CBS (Combi Brake System), tác động lực phanh cùng lúc ở 2 bánh xe khi bóp tay phanh bên trái, giúp người lái kiểm soát tốc độ của xe tốt hơn.
-Được tích hợp chức năng tìm xe và báo động chống trộm với một remote điều khiển rời.
-Xe có 2 ngăn để đồ phía trước, hộc bên trái chiều sâu tốt, để vừa điện thoại cỡ 6,5", có nắp đậy và bên trong được trang bị cổng nguồn 12V. Nếu muốn có thể trang bị thêm đồ chuyển sử dụng để sạc điện thoại và các thiết bị di động.',
N'Đen', 2, N'xe3.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (4, 1, N'HONDA SONIC', N'NHẬP KHẨU', N'XE CÔN TAY', 55000000.0000, 
N'-Sản phẩm có đèn Trước với công nghệ LED thiết kế 3D bóng độc đáo đem lại cảm giác dũng mãnh và đầy tự tin
Honda Sonic 150R được nhập khẩu trực tiếp từ Indo thông qua đường hải quan chính ngạch.
Xe có thiết kế nhỏ gọn, phù hợp với điều kiện đường xá đông đúc
Cổ tay lái cao cho góc lái rộng và khá thoải mái.
Cụm xi nhanh trước và sau tích hợp luôn vào cụm đèn pha và đèn chiếu hậu.',N'Đen', 4, N'xe4.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (5, 1, N'HONDA VARIO 125', N'NHẬP KHẨU', N'XE TAY GA', 39500000.0000, 
N'-ACG Starter : Công nghệ tiên tiến mang lại cảm giác sảng khoái khi khởi động động cơ mà không có âm thanh
-Idling Stop : Tính năng cao cấp tự động tắt động cơ khi dừng hơn 3 giây và động cơ khởi động lại khi vặn cần ga.
-Phanh Combi : Phanh dễ dàng và thoải mái hơn. Bằng cách kéo cần phanh bên trái, bánh trước và bánh sau sẽ dừng tối ưu.
Xe có thiết kế nhỏ gọn, phù hợp với điều kiện đường xá đông đúc
Cổ tay lái cao cho góc lái rộng và khá thoải mái.
Cụm xi nhanh trước và sau tích hợp luôn vào cụm đèn pha và đèn chiếu hậu.',N'Đen', 3, N'xe5.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (6, 1, N'HONDA VARIO 150', N'NHẬP KHẨU', N'XE TAY GA', 51000000.0000, N'Sản phầm có Màn hình điện tử LCD hiển thị sắc nét nhiều thông số cần thiết giúp quan sát dễ dàng tình trạng vận hành của xe',N'Đỏ', 2, N'xe6.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (7, 1, N'SUZUKI SATRIA', N'NHẬP KHẨU', N'XE CÔN TAY', 57500000.0000,
N'-Suzuki Satria nổi bật với cụm đèn pha LED, dàn nhựa trước, ống xả gọn gàng. 
-Xe có thêm một hộc chứa đồ nhỏ ở giữa yếm. Két nước làm mát mới, có kích thước lớn nhất trong những mẫu xe côn tay cỡ nhỏ cùng phân khúc. 
-Hệ thống phanh đĩa trang bị trên cả bánh trước/sau.
-Hệ thống phanh của xe là loại phanh kết hợp CBS (Combi Brake System), tác động lực phanh cùng lúc ở 2 bánh xe khi bóp tay phanh bên trái, giúp người lái kiểm soát tốc độ của xe tốt hơn.
-Được tích hợp chức năng tìm xe và báo động chống trộm với một remote điều khiển rời.',N'Đen đỏ', 2, N'xe7.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (8, 1, N'YAMAHA MT-15', N'NHẬP KHẨU', N'XE CÔN TAY', 71000000.0000, 
N'-Khung Deltabox cứng cáp, chắc chắn giúp xe vận hành ổn định.
-Tay lái rộng giúp tư thế ngồi thẳng đứng hơn, lái xe thoải mái hơn.
-Hệ thống sang số tay 6 cấp và đèn báo thời gian chuyển số giúp người lái dễ dàng đạt được hiệu suất tối ưu.
-Cánh tay phía sau bằng nhôm chắc chắn và nhẹ, giúp kiểm soát ổn định hơn
-Loại máy:Làm mát bằng dung dịch, 4 thì, SOHC, 4 van, VVA
-Số lượng / vị trí của xi lanh:Xi lanh đơn
-Đường kính x Bước	58,0 x 58,7 mm
-So sánh nén: 11,6: 1
-Công suất tối đa:14,2 kW / 10000 vòng / phút
-Mô-men xoắn cực đại:14,7 Nm / 8500 vòng / phút
-Hệ thống khởi động	Khởi động điện
-Hệ thống bôi trơn	ướt',N'Đen đỏ', 3,N'xe8.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (9, 1, N'YAMAHA MX - KING', N'NHẬP KHẨU', N'XE CÔN TAY', 47000000.0000,
N'-Với lốp không săm bản rộng trong phân khúc, thiết kế vành 17 inch, MX KING trông thể thao hơn và có Phanh Đĩa Đôi giúp tăng tối đa khả năng phanh và an toàn khi lái xe.
-Thiết kế khung ánh sáng. Đi kèm với tư thế lái thể thao là hệ thống treo Mono Shock ở phía sau và bệ để chân, người lái có thể gập lại giúp việc di chuyển & vào cua thoải mái hơn.
-Khối lượng xe:118 kg
-Loại khung xe:Backbone
-Dài x Rộng x cao:1985mm X 670mm X 1100mm
-Chiều dài cơ sở:1290mm
-Độ cao yên:795 mm
-Khoảng cách gầm xe:155 mm
-Đường kính x hành trình piston:57,0 x 58,7 mm
-Hệ thống phun xăng:FI
-Loại động cơ:Làm mát bằng chất lỏng 4 thì, SOHC
-Dung tích xy-lanh:150 cm3
-Tỉ số nén:10,4 : 1',N'Vàng đen',2, N'xe9.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (10, 1, N'YAMAHA R15', N'NHẬP KHẨU', N'XE CÔN TAY', 71000000.0000,
N'-Khung Deltabox cứng cáp, chắc chắn giúp xe vận hành ổn định.
-Tay lái rộng giúp tư thế ngồi thẳng đứng hơn, lái xe thoải mái hơn.
-Hệ thống sang số tay 6 cấp và đèn báo thời gian chuyển số giúp người lái dễ dàng đạt được hiệu suất tối ưu.
-Cánh tay phía sau bằng nhôm chắc chắn và nhẹ, giúp kiểm soát ổn định hơn
-Loại máy:Làm mát bằng dung dịch, 4 thì, SOHC, 4 van, VVA
-Số lượng / vị trí của xi lanh: Xi lanh đơn
-Đường kính x Bước:58,0 x 58,7 mm
-So sánh nén:11,6: 1
-Công suất tối đa:14,2 kW / 10000 vòng / phút
-Mô-men xoắn cực đại:14,7 Nm / 8500 vòng / phút
-Hệ thống khởi động:Khởi động điện',N'Xanh đen', 3, N'xe10.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (11, 2, N'AIR BLADE 120', N'HONDA', N'XE TAY GA', 42000000.0000,
N'-Kiểu dáng thể thao cao cấp
-Tem xe cùng phối màu mới mới ấn tượng
-Cụm đèn LED trước
-Mặt đồng hồ LCD  
- thống khóa thông minh
-Hộc đựng đồ rộng rãi
-Đèn chiếu sáng phía trước luôn sáng
-Với lốp không săm bản rộng trong phân khúc, thiết kế vành 17 inch, MX KING trông thể thao hơn và có Phanh Đĩa Đôi giúp tăng tối đa khả năng phanh và an toàn khi lái xe.
-Thiết kế khung ánh sáng. Đi kèm với tư thế lái thể thao là hệ thống treo Mono Shock ở phía sau và bệ để chân, người lái có thể gập lại giúp việc di chuyển & vào cua thoải mái hơn.',N'Đỏ đen', 3, N'xe11.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (12, 2, N'AIR BLADE 150', N'HONDA', N'XE TAY GA', 52500000.0000,
N'-Kiểu dáng thể thao cao cấp
-Tem xe cùng phối màu mới mới ấn tượng
-Cụm đèn LED trước
-Mặt đồng hồ LCD
-Động cơ 150cc
-Khả năng tăng tốc vượt trội (dành cho
-Hệ thống khóa thông minh
-Hệ thống chống bó cứng phanh ABS (dành cho Air Blade 150cc)
-Hộc đựng đồ rộng rãi
-Cổng sạc tiện lợi (dành cho Air Blade 150cc)
-Đèn chiếu sáng phía trước luôn sáng',N'Đỏ đen', 2, N'xe12.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (13, 2, N'FUTURE', N'HONDA', N'XE SỐ', 36000000.0000,
N'-Kế thừa danh tiếng vốn có của Future, thiết kế mới cao cấp và lịch lãm hơn - thể hiện được khí chất của người lái - với cảm giác sang trọng được tạo nên bởi những đường cong dọc thân xe cùng thiết kế liền khối và mạnh mẽ.
-Logo "Future" 3D
-Đèn pha LED
-Ổ khoá 4 trong 1
-Hộc đựng đồ lớn dễ dàng để vừa 1 mũ bảo hiểm cả đầu.
-Hệ thống đèn chiếu sáng phía trước có tính năng tự động bật sáng, đảm bảo cho người sử dụng có tầm nhìn tốt nhất, hạn chế các trường hợp quên bật đèn pha khi đi trong điều kiện ánh sáng không đảm bảo, giúp khả năng hiện diện của xe khi lưu thông trên đường phố được nâng cao-Loại máy:Làm mát bằng dung dịch, 4 thì, SOHC, 4 van, VVA
-Số lượng / vị trí của xi lanh:Xi lanh đơn
-Đường kính x Bước	58,0 x 58,7 mm
-So sánh nén: 11,6: 1
-Công suất tối đa:14,2 kW / 10000 vòng / phút
-Mô-men xoắn cực đại:14,7 Nm / 8500 vòng / phút
-Hệ thống khởi động	Khởi động điện
-Hệ thống bôi trơn	ướt',N'Trắng Nâu Đen', 6, N'xe13.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (14, 2, N'LEAD', N'HONDA', N'XE TAY GA', 43000000.0000,
N'Kiểu dáng thanh lịch hoàn toàn mới
Tem xe mới thời trang
Động cơ eSP thông minh thế hệ mới
LEAD được trang bị eSP - động cơ thông minh thế hệ mới, 4 kỳ, xy-lanh đơn, làm mát bằng dung dịch, tích hợp những công nghệ tiên tiến nhất và tiết kiệm nhiên liệu.
-Hệ thống khóa thông minh
-Hệ thống chống bó cứng phanh ABS (dành cho Air Blade 150cc)
-Hộc đựng đồ rộng rãi
-Cổng sạc tiện lợi
-Đèn chiếu sáng phía trước luôn sáng',N'Trắng Nâu', 4, N'xe14.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (15, 2, N'SH 125', N'HONDA', N'XE TAY GA', 83500000.0000,
N'-Thân xe được thiết kế lại hoàn toàn giúp tối đa hoá sự linh hoạt khi di chuyển. Người lái sẽ cảm nhận được sự thoải mái khi điều khiển trong thành phố và đầy tự tin ở tốc độ cao.
-Logo SH hoàn toàn mới được dập nổi cùng thiết kế vân 3D ẩn tượng, thu hút mọi ánh nhìn
-Thân xe được thiết kế lại hoàn toàn giúp tối đa hoá sự linh hoạt khi di chuyển. Người lái sẽ cảm nhận được sự thoải mái khi điều khiển trong thành phố và đầy tự tin ở tốc độ cao.
-Động cơ eSP+ là bước tiến so với thế hệ động cơ eSP cũ, động cơ eSP+ mới giúp mẫu xe vận hành mạnh mẽ vượt trội, tiết kiệm nhiên liệu và thân thiện môi trường
-Hệ thống ngắt động cơ tạm thời (Idling Stop) giúp tự động ngắt động cơ khi xe dừng tạm thời và khởi động lại dễ dàng, giúp tiết kiệm tối đa nhiên liệu.
-Hệ thống khóa thông minh Honda SMART Key
-Hộc chứa đồ dung tích hộc chứa đồ lên đến 28L, cho phép người lái mang thêm được nhiều vật dụng. Ngoài ra, hộc còn tích hợp thêm cổng USB tiện dụng cho phép sạc pin điện thoại khi cần.
-Nắp bình xăng được thay đổi vị trí ra phía trước, giúp việc đổ xăng thuận tiện hơn khi không cần mở yên xe.
-Tay lái bên trái có thêm công tắc đa dụng để dễ dàng chuyển đổi qua lại giữa các màn hình và chế độ khác nhau.'
,N'Đỏ đen', 3, N'xe15.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (16, 2, N'SH 150', N'HONDA', N'XE TAY GA', 11200000.0000,
N'Thân xe được thiết kế lại hoàn toàn giúp tối đa hoá sự linh hoạt khi di chuyển. Người lái sẽ cảm nhận được sự thoải mái khi điều khiển trong thành phố và đầy tự tin ở tốc độ cao.
Logo SH hoàn toàn mới được dập nổi cùng thiết kế vân 3D ẩn tượng, thu hút mọi ánh nhìn
Động cơ eSP+ là bước tiến so với thế hệ động cơ eSP cũ, động cơ eSP+ mới giúp mẫu xe vận hành mạnh mẽ vượt trội, tiết kiệm nhiên liệu và thân thiện môi trường
Hệ thống ngắt động cơ tạm thời (Idling Stop) giúp tự động ngắt động cơ khi xe dừng tạm thời và khởi động lại dễ dàng, giúp tiết kiệm tối đa nhiên liệu.
Hệ thống khóa thông minh Honda SMART Key
Hệ thống chống bó cứng phanh  ABS được trang bị trên cả 2 bánh cho phép người lái tự tin trong mọi tình huống như phanh gấp khi đường trơn hoặc trời mưa
Hộc chứa đồ dung tích hộc chứa đồ lên đến 28L, cho phép người lái mang thêm được nhiều vật dụng. Ngoài ra, hộc còn tích hợp thêm cổng USB tiện dụng cho phép sạc pin điện thoại khi cần.
Nắp bình xăng được thay đổi vị trí ra phía trước, giúp việc đổ xăng thuận tiện hơn khi không cần mở yên xe.
Tay lái bên trái có thêm công tắc đa dụng để dễ dàng chuyển đổi qua lại giữa các màn hình và chế độ khác nhau.
Kết nối điện thoại qua Bluetooth Để mang lại trải nghiệm đẳng cấp như ngồi trên xe hơi, Honda Việt Nam lần đầu tiên tích hợp công nghệ kết nối với điện thoại thông minh trên mẫu xe SH 150i, giúp người lái nhận thông báo cuộc gọi, tin nhắn đến trên mặt đồng hồ.
Hơn thế nữa, nhờ công nghệ này, Khách hàng còn có thể truy cập và đọc toàn bộ thông tin xe qua My Honda+, ứng dụng hỗ trợ quản lý và bảo dưỡng xe được phát triển bởi Honda Việt Nam. Qua đó, My Honda+ có thể đưa ra các lời khuyên thích hợp cũng như nhắc nhở thay dầu định kỳ để luôn giữ cho xe ở tình trạng tốt nhất. Không chỉ vậy, nhằm nâng tầm trải nghiệm di chuyển cho tất cả Khách hàng sử dụng xe máy và ô tô, ứng dụng My Honda+ được tích hợp thêm các chức năng thông minh như bảo hành điện tử, theo dõi lịch sử bảo dưỡng và sửa chữa, nhắc lịch bảo dưỡng, cập nhật thông tin sản phẩm và dịch vụ.', 
N'Đỏ đen', 2, N'xe16.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (17, 2, N'SH MODE', N'HONDA', N'XE TAY GA', 73500000.0000,
N'-Thuộc phân khúc xe ga cao cấp và thừa hưởng thiết kế sang trọng nổi tiếng của dòng xe SH, Sh mode luôn được đánh giá cao nhờ kiểu dáng thanh lịch, tinh tế tới từng đường nét. 
-Vành đúc trước và sau với các nan nhỏ lấy cảm hứng từ những đôi giày gót nhọn sành điệu, gợi lên bước chân thanh lịch, tao nhã của các quý cô khi dạo phố.
-Logo "Sh" 3D nổi trên thân xe có hình dáng tựa như logo của dòng xe SH đẳng cấp, tiếp nối là logo "mode" với đường nét tinh xảo, thiết kế bo tròn thể hiện sự mềm mại, thanh lịch và nữ tính.
-Lấy cảm hứng từ chiếc đồng hồ đeo tay cao cấp, mặt đồng hồ với thiết kế đơn giản, sang trọng được nâng cấp với viền phát sáng hình tròn bao quanh, đem lại "hiệu ứng ánh sáng" vào ban đêm.
-Sh mode mới sở hữu động cơ thế hệ mới eSP+ 4 van đánh dấu bước đột phá trong công nghệ động cơ của Honda, giúp tăng hiệu suất hoạt động, khả năng vận hành mạnh mẽ vượt trội, tiết kiệm nhiên liệu và thân thiện môi trường.
-Có khả năng tự động ngắt động cơ khi dừng xe trên 3 giây và khởi động lại động cơ khi xe bắt đầu di chuyển chỉ bằng thao tác vặn tay ga, giúp giảm tiếng ồn, tiết kiệm nhiên liệu và bảo vệ môi trường.
-Hộc để đồ phía trước bên trái được trang bị trên dòng xe Sh mode với dạng nắp mở, tích hợp cổng sạc USB vô cùng tiện lợi.
-Bánh trước được trang bị hệ thống chống bó cứng phanh ABS (*) giúp ổn định sự cân bằng của xe, đặc biệt trong trường hợp phanh gấp trên đường trơn ướt, mang lại cảm giác an tâm khi vận hành xe (*) Phiên bản ABS ',
N'Đen đỏ', 3, N'xe17.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (18, 2, N'VISION 2021', N'HONDA', N'XE TAY GA', 83500000.0000,
N'-Thiết kế phía trước hiện đại và năng động
-Logo 3D năng động và ấn tượng
-Thiết kế vành đúc mới nổi bật
-Loại máy:Làm mát bằng dung dịch, 4 thì, SOHC, 4 van, VVA
-Số lượng / vị trí của xi lanh:Xi lanh đơn
-Đường kính x Bước: 60,0 x 58,7 mm
-So sánh nén: 11,6: 1
-Công suất tối đa:14,2 kW / 10000 vòng / phút
-Mô-men xoắn cực đại:14,7 Nm / 8500 vòng / phút
-Hệ thống khởi động	Khởi động điện
-Hệ thống bôi trơn	ướt',N'Đen đỏ', 3, N'xe18.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (19, 2, N'WAVE ALPHA', N'HONDA', N'XE SỐ', 19000000.0000,
N'Thiết kế tem mới với những đường nét ấn tượng chạy dọc thân xe mang lại hình ảnh tổng thể mới lạ và cá tính.
Các thông số vận hành được hiển thị đầy đủ giúp người lái quan sát một cách dễ dàng và thuận tiện.
Wave Alpha 110cc được trang bị động cơ 110cc với hiệu suất vượt trội mà vẫn đảm bảo khả năng tiết kiệm nhiên liệu một cách tối ưu.
Ổ khóa bao gồm khóa điện, khóa cổ và khóa từ, dễ sử dụng và chống rỉ sét hiệu quả.
Đèn chiếu sáng phía trước có tính năng tự động bật sáng.
Khối lượng bản thân 97kg
Dài x Rộng x Cao 1.914mm x 688mm x 1.075mm
Khoảng cách trục bánh xe 1.224mm
Độ cao yên 769mm
Khoảng sáng gầm xe 138mm
Dung tích bình xăng 3,7 lít
Kích cỡ lớp trước/ sau Trước: 70/90 - 17 M/C 38P; Sau: 80/90 - 17 M/C 50P
Phuộc trước Ống lồng, giảm chấn thủy lực',N'Đỏ trắng', 2, N'xe19.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (20, 2, N'WAVE BLADE', N'HONDA', N'XE SỐ', 18000000.0000,
N'-Mặt đồng hồ hiện đại sở hữu đường nét tinh tế, các thông số được hiển thị đầy đủ, giúp người điều khiển quan sát thuận tiện.
-Thân xe vuốt gọn và thiết kế phía sau trẻ trung
-Những dải tem thuôn gọn vuốt dọc thân xe kết hợp cùng tem chữ "RACE" trên phiên bản vành đúc phanh đĩa càng mang lại cảm giác hiện đại và năng động cho người lái
-Ống xả chếch cao tạo vẻ đẹp khỏe khoắn, hòa quyện tuyệt vời với thiết kế năng động của chiếc xe
-Với sự kế thừa các tính năng ưu việt của động cơ Honda 110cc danh tiếng như độ bền cao, vận hành ổn định, Honda Blade 110 giúp động cơ tiết kiệm nhiên liệu vượt trội và bảo vệ môi trường, đáp ứng tiêu chuẩn khí thải Euro 3 nghiêm ngặt.
-Sang số êm ái, dễ dàng
-Ổ khóa được thiết kế hiện đại bao gồm khóa điện, khóa cổ và khóa từ - tăng tính an toàn, dễ sử dụng và chống rỉ sét hiệu quả
-Đèn chiếu sáng phía trước luôn sáng
-Dài x Rộng x Cao:  1.920 x 702 x 1.075 mm
-Khoảng cách trục bánh xe: 1.217 mm
-Độ cao yên: 769 mm
-Khoảng sáng gầm xe: 141 mm
-Dung tích bình xăng: 3,7 lít
-Kích cỡ lớp trước/ sau: Trước: 70/90 -17 M/C 38P; Sau: 80/90 - 17 M/C 50P
-Phuộc trước: Ống lồng, giảm chấn thủy lực', 
N'Đen đỏ', 4, N'xe20.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (21, 2, N'WAVE RSX', N'HONDA', N'XE SỐ', 22300000.0000,
N'Phong cách thiết kế đột phá với các đường nổi phá cách độc đáo và thanh thoát trên thân xe. Logo 3D "RSX" (trên phiên bản phanh đĩa vành đúc) kết hợp cùng tem chữ "sport" ấn tượng ở cả 3 phiên bản càng làm nổi bật lên một phong cách riêng chỉ có của Wave RSX.
Thiết kế phía sau mang dáng vẻ vô cùng khỏe khoắn với cụm đèn hậu vuốt cao kiêu hãnh tăng thêm dấu ấn cá tính cho Wave RSX mới.
Wave RSX Fi được trang bị động cơ 110cc, phun xăng điện tử, 4 kỳ, xi-lanh đơn, đáp ứng tiêu chuẩn khí thải Euro 3, tối ưu hóa khả năng tăng tốc, không những tiết kiệm nhiên liệu mà còn đảm bảo sự bền bỉ, vận hành mạnh mẽ và ổn định.
Wave RSX Fi được trang bị ổ khóa tích hợp bao gồm khóa điện, khóa từ, khóa cổ và khóa yên rất dễ sử dụng, an tâm hơn và chống rỉ sét.
Hộc đựng đồ tiện lợi có khả năng chứa được 01 mũ bảo hiểm nửa đầu cùng những vật dụng cá nhân khác.
Khối lượng bản thân: 99kg (vành đúc và vành nan hoa phanh đĩa); 98kg (vành nan hoa, phanh trước loại phanh cơ)
Dài x Rộng x Cao: 1.921 mm x 709 mm x 1.081 mm
Khoảng cách trục bánh xe: 1.227mm
Độ cao yên: 760mm
Khoảng sáng gầm xe: 135mm
Dung tích bình xăng: 4 lít
Kích cỡ lớp trước/ sau: Trước: 70/90 - 17 M/C 38P; Sau: 80/90 - 17 M/C 50P
Phuộc trước: Ống lồng, giảm chấn thủy lực
Phuộc sau: Lò xo trụ, giảm chấn thủy lực',N'Đen đỏ', 4, N'xe21.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (22, 2, N'WINNER X', N'HONDA', N'XE CÔN TAY', 41000000.0000,
N'Honda WINNER X tiếp tục khẳng định vị thế với phối màu và tem mới làm nổi bật khí chất đỉnh cao của người lái.
Mặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng.
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực
Phuộc sau: Lò xo trụ đơn',N'Đen', 2, N'xe22.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (23, 2, N'AIR BLADE 125', N'HONDA', N'XE TAY GA', 42000000.0000,
N'Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực
Phuộc sau: Lò xo trụ đơn',
N'Xanh đen', 5, N'xe23.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (24, 2, N'FUTURE', N'HONDA', N'XE SỐ', 36000000.0000,
N'Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng
ặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Đen', 3, N'xe24.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (25, 2, N'LEAD', N'HONDA', N'XE TAY GA', 43000000.0000,
N'Mặt đồng hồ hiện đại sở hữu đường nét tinh tế, các thông số được hiển thị đầy đủ, giúp người điều khiển quan sát thuận tiện.
Thân xe vuốt gọn và thiết kế phía sau trẻ trung
Những dải tem thuôn gọn vuốt dọc thân xe kết hợp cùng tem chữ "RACE" trên phiên bản vành đúc phanh đĩa càng mang lại cảm giác hiện đại và năng động cho người lái
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực
Phuộc sau: Lò xo trụ đơn',N'Đỏ đen', 3, N'xe25.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (27, 3, N'ACRUZO', N'YAMAHA', N'XE TAY GA', 34000000.0000,
N'Xe Yamaha Acruzo được trang bị động cơ Blue Core giúp giảm trọng lượng xe và tiết kiệm nhiên liệu tối ưu. 
Điểm vượt trội của xe Acruzo Yamaha có thể kể đến chính là dung tích cốp chứa đồ siêu rộng lên đến 37 lít, chứa được tối đa 3 mũ bảo hiểm nửa đầu cùng nhiều vật dụng cá nhân khác. 
Không chỉ vậy,  xe Acruzo còn có nhiều màu sắc thời trang cho người dùng thoải mái lựa chọn mẫu xe phù hợp với sở thích.
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực
Phuộc sau: Lò xo trụ đơn
',N'Đen', 3, N'xe26.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (28, 3, N'EXCITER 150', N'YAMAHA', N'XE CÔN TAY', 46500000.0000,
N'Exciter 150 được trang bị:
-Nút đèn pha xin vượt dễ dàng ra hiệu cho người cùng lưu thông trên đường khi bạn muốn vượt
-Khóa Định Vị Answer back key nhận tín hiệu trong phạm vi 20m giúp tìm xe nhanh chóng ở trong bãi đỗ xe hoặc trong bóng tối.
-Đèn Trước với công nghệ LED thiết kế 3D bóng độc đáo đem lại cảm giác dũng mãnh và đầy tự tin
-Động cơ xe côn tay 150cc mạnh mẽ, làm mát bằng dung dịch kết hợp với công nghệ phun xăng điện tử độc quyền của Yamaha cho khả năng vận hành vượt trội, tăng tốc bứt phá và tiết kiệm nhiên liệu tối ưu.
-Màn hình điện tử LCD hiển thị sắc nét nhiều thông số cần thiết giúp quan sát dễ dàng tình trạng vận hành của xe.
-Nút bật tắt động cơ khẩn cấp trong tình huống ngã xe mà động cơ vẫn hoạt động
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 180 mm
Dung tích bình xăng:5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Xanh đen', 5, N'xe27.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (29, 3, N'EXCITER 155 VVA', N'YAMAHA', N'XE CÔN TAY', 45000000.0000,
N'Cụm đèn pha độc lập 2 vị trí
Cải thiện khả năng tản nhiệt và làm mát: Lỗ thông khí ở các-te giúp giảm tổn hao khi bơm. Hệ thống làm mát với bộ điều chỉnh nhiệt kiểu vòng giảm thời gian khởi động động cơ và góp phần vào hiệu suất làm sạch khí thải.
Hệ thống ống xả cải thiện hơn: Ống xả và pô xe được bố trí cho công suất đầu ra tối ưu, với bộ xúc tác mới giúp lọc sạch khí thải. Bổ sung tấm lót sợi thủy tinh trong ống giảm thanh cho tiếng pô trầm và đanh gọn, giảm độ ồn.
Nâng cấp hệ thống giảm xóc
Phuộc trước được tinh chỉnh hành trình dài hơn, tăng từ 90mm lên 100mm, kết hợp các vi chỉnh cho hiệu quả giảm chấn tốt hơn. Phuộc sau dạng giảm xóc trục đơn thể thao giúp vào cua ổn định và an toàn.
Phanh trước 2 piston
Phanh đĩa bánh trước trang bị kẹp má phanh kép gồm 2 piston cung cấp lực phanh mạnh hơn 17%. Các bộ phận dẫn lực và ma sát được thiết kế cứng chắc tạo nên hệ thống phanh hiệu quả hơn. (Chỉ có ở phiên bản cao cấp)
Mặt đồng hồ full LCD đa chức năng
Hệ thống khóa thông minh (Chỉ có ở phiên bản cao cấp)
Ổ cắm điện tích hợp 12V (Chỉ có ở phiên bản cao cấp)
Xích kín
Xích kín có phớt (bu lông) tăng tuổi thọ, chống bám bùn đất giúp bền bỉ và êm ái, vận hành tốt hơn.
Yên xe phong cách thể thao (solo)
Bình xăng lớn 5.4 lít 
Đèn hậu thiết kế vuốt gọn tương tự YZF-R1
Chắn bùn sau được thiết kế mới tương tư YZF-R1
Công tắc ngắt động cơ
Nút đèn pha xin vượt', 
N'Đen', 3, N'xe28.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (30, 3, N'FREEGO', N'YAMAHA', N'XE TAY GA', 33500000.0000, 
N'Yamaha Freego là mẫu xe tay ga thể thao đời mới có mức giá rất hợp lý trong khi được trang bị toàn diện các tính năng như: 
-Khóa thông minh Smart key
-Phanh ABS
-Cốp xe rộng 25 lít, tích hợp cổng sạc điện thoại tiện lợi
-Hệ thống đèn LED trước - sau
-Sàn để chân thoải mái
-Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
-Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
-Khoảng cách trục bánh xe: 1.278 mm
-Độ cao yên: 795 mm
-Khoảng sáng gầm xe: 180 mm
-Dung tích bình xăng:5 lít
-Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
-Phuộc trước: Ống lồng, giảm chấn thủy lực
',N'Trắng đen', 5, N'xe29.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (31, 3, N'GRANDE BLUE CORE HYBRID', N'YAMAHA', N'XE TAY GA', 46000000.0000,
N'Cụm đèn pha độc lập 2 vị trí
Cải thiện khả năng tản nhiệt và làm mát: Lỗ thông khí ở các-te giúp giảm tổn hao khi bơm. Hệ thống làm mát với bộ điều chỉnh nhiệt kiểu vòng giảm thời gian khởi động động cơ và góp phần vào hiệu suất làm sạch khí thải.
Hệ thống ống xả cải thiện hơn: Ống xả và pô xe được bố trí cho công suất đầu ra tối ưu, với bộ xúc tác mới giúp lọc sạch khí thải. Bổ sung tấm lót sợi thủy tinh trong ống giảm thanh cho tiếng pô trầm và đanh gọn, giảm độ ồn.
Nâng cấp hệ thống giảm xóc
Phuộc trước được tinh chỉnh hành trình dài hơn, tăng từ 90mm lên 100mm, kết hợp các vi chỉnh cho hiệu quả giảm chấn tốt hơn. Phuộc sau dạng giảm xóc trục đơn thể thao giúp vào cua ổn định và an toàn.
Phanh trước 2 piston
Phanh đĩa bánh trước trang bị kẹp má phanh kép gồm 2 piston cung cấp lực phanh mạnh hơn 17%. Các bộ phận dẫn lực và ma sát được thiết kế cứng chắc tạo nên hệ thống phanh hiệu quả hơn. (Chỉ có ở phiên bản cao cấp)
Mặt đồng hồ full LCD đa chức năng
Hệ thống khóa thông minh (Chỉ có ở phiên bản cao cấp)
Ổ cắm điện tích hợp 12V (Chỉ có ở phiên bản cao cấp)
Xích kín
Xích kín có phớt (bu lông) tăng tuổi thọ, chống bám bùn đất giúp bền bỉ và êm ái, vận hành tốt hơn.
Yên xe phong cách thể thao (solo)
Bình xăng lớn 5.4 lít 
Đèn hậu thiết kế vuốt gọn tương tự YZF-R1
Chắn bùn sau được thiết kế mới tương tư YZF-R1
Công tắc ngắt động cơ
Nút đèn pha xin vượt',N'Trắng', 2, N'xe30.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (32, 3, N'JANUS', N'YAMAHA', N'XE TAY GA', 31500000.0000,
N'Xe số Yamaha Jupiter bao gồm phiên bản RC và phiên bản GP, được đánh giá và công nhận là mẫu xe số tiết kiệm xăng số 1 Việt Nam với mức tiêu thụ chỉ 1,55 lít/100km.
-Đầu xe thiết kế tinh tế, tỉ mỉ với hai cụm đèn xi nhan kiểu dáng "sao băng".
-Đuôi xe mạnh mẽ.
-Cốp xe rộng.
-Giảm xóc hiệu quả cao.
-Ổ khóa 4 trong 1.
-Nắp xăng bên ngoài tiện lợi.
-Sàn để chân thoải mái.
-Cốp xe rộng.
',N'Đen Nhám', 5, N'xe31.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (33, 3, N'JUPITER', N'YAMAHA', N'XE SỐ', 29900000.0000,
N'Xe số bao gồm phiên bản RC và phiên bản GP, được đánh giá và công nhận là mẫu xe số tiết kiệm xăng số 1 Việt Nam với mức tiêu thụ chỉ 1,55 lít/100km
Cải thiện khả năng tản nhiệt và làm mát: Lỗ thông khí ở các-te giúp giảm tổn hao khi bơm. Hệ thống làm mát với bộ điều chỉnh nhiệt kiểu vòng giảm thời gian khởi động động cơ và góp phần vào hiệu suất làm sạch khí thải.
Hệ thống ống xả cải thiện hơn: Ống xả và pô xe được bố trí cho công suất đầu ra tối ưu, với bộ xúc tác mới giúp lọc sạch khí thải. Bổ sung tấm lót sợi thủy tinh trong ống giảm thanh cho tiếng pô trầm và đanh gọn, giảm độ ồn.
Nâng cấp hệ thống giảm xóc
Phuộc trước được tinh chỉnh hành trình dài hơn, tăng từ 90mm lên 100mm, kết hợp các vi chỉnh cho hiệu quả giảm chấn tốt hơn. Phuộc sau dạng giảm xóc trục đơn thể thao giúp vào cua ổn định và an toàn.
Phanh trước 2 piston
Ổ khóa bao gồm khóa điện, khóa cổ và khóa từ, dễ sử dụng và chống rỉ sét hiệu quả.
Đèn chiếu sáng phía trước có tính năng tự động bật sáng.
Khối lượng bản thân 97kg
Dài x Rộng x Cao 1.914mm x 688mm x 1.075mm
Khoảng cách trục bánh xe 1.224mm',N'Đen đỏ', 3, N'xe32.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (34, 4, N'CANDY HERMOSA 50CC', N'SUZUKI', N'XE TAY GA', 26500000.0000,
 N'Tem xe mới dạng tem nổi mạ crom.
Hệ thống đèn báo dạng Led cho ánh sáng mạnh an toàn và tuổi thọ cao.
Cốp xe có viền cao su xung quanh, tăng khả năng chống bụi – chống nước.
Nắp bình xăng trước tiện lợi.
Động cơ bền bỉ, máy nổ êm, sang số nhẹ nhàng và tiết kiệm nhiên liệu.
Phuộc nhún chịu tải nặng tốt, giảm xóc êm ái khi vượt qua mọi địa hình, thích hợp với sự năng động của các bạn trẻ.
Đèn pha chiếu sáng Halogen vượt trội 20% so với các xe số khác, an toàn hơn và thêm phần tự tin cho bạn.
Tem xe được thiết kế mới, phong cách hơn và thời trang hơn.',N'Đỏ đô', 5, N'xe33.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (35, 4, N'CANDY HI 20CC', N'SUZUKI', N'XE TAY GA', 24500000.0000,
N'Dòng xe “kẹo ngọt” dành cho khách hàng trẻ tuổi.
Candy Hi 50 được trang bị động cơ 4 thì cùng dung tích xy-lanh 49,5 cm3. 
Với rất nhiều tính năng tiện dụng, Candy Hi 50 là lựa chọn tuyệt vời cho học sinh, sinh viên đang tìm kiếm phương tiện di chuyển nhẹ nhàng và tiện lợi.
Ổ khóa 4 trong 1.
Nắp xăng bên ngoài tiện lợi.
Sàn để chân thoải mái.
Cốp xe rộng.
Ổ khóa bao gồm khóa điện, khóa cổ và khóa từ, dễ sử dụng và chống rỉ sét hiệu quả.
Đèn chiếu sáng phía trước có tính năng tự động bật sáng.
Khối lượng bản thân 97kg
Dài x Rộng x Cao 1.914mm x 688mm x 1.075mm
Khoảng cách trục bánh xe 1.224mm
',N'Trắng', 4, N'xe34.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (36, 4, N'K-PIPE 50CC', N'SUZUKI', N'XE CÔN TAY', 22500000.0000,
N'Đèn đôi thể thao
Mặt đồng hồ LCD
Phuộc thể thao monoshock
Công tắc ngắt động cơ
Ổ khóa bao gồm khóa điện, khóa cổ và khóa từ, dễ sử dụng và chống rỉ sét hiệu quả.
Đèn chiếu sáng phía trước có tính năng tự động bật sáng.
Khối lượng bản thân 97kg
Dài x Rộng x Cao 1.914mm x 688mm x 1.075mm
Khoảng cách trục bánh xe 1.224mm
Độ cao yên 769mm
Khoảng sáng gầm xe 138mm
Dung tích bình xăng 3,7 lít
Kích cỡ lớp trước/ sau Trước: 70/90 - 17 M/C 38P; Sau: 80/90 - 17 M/C 50P
Phuộc trước Ống lồng, giảm chấn thủy lực',N'Đen đỏ', 5, N'xe35.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (37, 5, N'ANGELA 50CC', N'SUZUKI', N'XE SỐ', 15900000.0000,
N'Tem xe mới dạng tem nổi mạ crom.
Yên dày và êm ái, thiết kế dạng ngang và hơi phân ra 2 tầng cho người lái và người ngồi sau cảm giác thoải mái
Cốp xe siêu rộng rãi, chứa được 2 nón bảo hiểm 1/2 đầu và nhiều vật dụng khác ( balo, túi xách, bóp tiền, …). Không gian chứa đồ dưới yên đảm bảo an toàn
Động cơ bền bỉ, máy nổ êm, sang số nhẹ nhàng và tiết kiệm nhiên liệu.
Phuộc nhún chịu tải nặng tốt, giảm xóc êm ái khi vượt qua mọi địa hình, thích hợp với sự năng động của các bạn trẻ.
Đèn pha chiếu sáng Halogen vượt trội 20% so với các xe số khác, an toàn hơn và thêm phần tự tin cho bạn.
Tem xe được thiết kế mới, phong cách hơn và thời trang hơn.',
N'Đen', 7, N'xe36.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (40, 5, N'ELEGANT 50CC', N'SUZUKI', N'XE SỐ', 20000000.0000,
N'Ổ khóa bao gồm khóa điện, khóa cổ và khóa từ, dễ sử dụng và chống rỉ sét hiệu quả.
Đèn chiếu sáng phía trước có tính năng tự động bật sáng.
Khối lượng bản thân 97kg
Dài x Rộng x Cao 1.914mm x 688mm x 1.075mm
Khoảng cách trục bánh xe 1.224mm
Độ cao yên 769mm
Khoảng sáng gầm xe 138mm
Dung tích bình xăng 3,7 lít
Kích cỡ lớp trước/ sau Trước: 70/90 - 17 M/C 38P; Sau: 80/90 - 17 M/C 50P
Phuộc trước Ống lồng, giảm chấn thủy lực',N'Đỏ', 10, N'xe37.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (41, 5, N'ELITE 50CC', N'SUZUKI', N'XE TAY GA', 25000000.0000,
N'Khoang chứa đồ rộng rãi, vừa vặn để một chiếc nón bảo hiểm. Có thêm hộc chứa đồ nhỏ phía trước cất giữ đồ gọn nhẹ.
Đèn đuôi dạng phản xạ nhiều tầng, dễ nhận dạng, báo hiệu tốt và an toàn cho xe sau.
Đèn pha siêu sáng 35w, độ tụ sáng tập trung, chiếu sáng xa và mạnh.
Động cơ cải tiến kỹ thuật mới, vô số nhẹ nhàng, nổ êm, tiết kiệm xăng.
Đèn signal và đèn trang trí phía trước dạng kim cương, tăng hiệu quả báo hiệu và nét thẩm mỹ cho xe.
Tem xe mới dạng tem nổi mạ crom.
Yên dày và êm ái, thiết kế dạng ngang và hơi phân ra 2 tầng cho người lái và người ngồi sau cảm giác thoải mái
Cốp xe siêu rộng rãi, chứa được 2 nón bảo hiểm 1/2 đầu và nhiều vật dụng khác ( balo, túi xách, bóp tiền, …).',N'Trắng', 5, N'xe38.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (42, 5, N'CANDY HERMOSA', N'SYM', N'XE TAY GA', 35000000.0000,
N'Cải tiến với nắp bình xăng được đặt phía trước. Nhờ đó mà không cần phải bước xuống xe mở cốp khi đổ xăng, đồ trong cốp cũng được đảm bảo an toàn
Gác chân tự động chỉ cần dùng tay ấn nhẹ nút dưới yên, gác chân sau tự bật ra nhẹ nhàng và êm ái
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng
ặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Xanh', 2, N'xe39.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (43, 5, N'CANDY', N'SYM', N'XE TAY GA', 37000000.0000,
N'Cải tiến với nắp bình xăng được đặt phía trước. Nhờ đó mà không cần phải bước xuống xe mở cốp khi đổ xăng, đồ trong cốp cũng được đảm bảo an toàn
Gác chân tự động chỉ cần dùng tay ấn nhẹ nút dưới yên, gác chân sau tự bật ra nhẹ nhàng và êm ái
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng
ặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Xanh', 2, N'xe40.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (44, 5, N'CANDY HI 50CC', N'SYM', N'XE TAY GA', 30000000.0000,
N'Cải tiến với nắp bình xăng được đặt phía trước. Nhờ đó mà không cần phải bước xuống xe mở cốp khi đổ xăng, đồ trong cốp cũng được đảm bảo an toàn
Gác chân tự động chỉ cần dùng tay ấn nhẹ nút dưới yên, gác chân sau tự bật ra nhẹ nhàng và êm ái
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng
ặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Đen', 6, N'xe40.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (45, 1, N'HONDA', N'XE NHẬP KHẨU', N'XE TAY GA', 30000000.0000,
N'Cải tiến với nắp bình xăng được đặt phía trước. Nhờ đó mà không cần phải bước xuống xe mở cốp khi đổ xăng, đồ trong cốp cũng được đảm bảo an toàn
Gác chân tự động chỉ cần dùng tay ấn nhẹ nút dưới yên, gác chân sau tự bật ra nhẹ nhàng và êm ái
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng
ặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Đen', 6, N'xe40.png')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (46, 1, N'CANDY HI', N'XE NHẬP KHẨU', N'XE TAY GA', 30000000.0000,
N'Cải tiến với nắp bình xăng được đặt phía trước. Nhờ đó mà không cần phải bước xuống xe mở cốp khi đổ xăng, đồ trong cốp cũng được đảm bảo an toàn
Gác chân tự động chỉ cần dùng tay ấn nhẹ nút dưới yên, gác chân sau tự bật ra nhẹ nhàng và êm ái
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày như đổ xăng hoặc bảo dưỡng
ặt đồng hồ nhỏ gọn, hình khối thể thao, kèm màn hình LCD dạng âm bản hiện đại.
Chất siêu phẩm của WINNER X còn tiếp tục được nhấn mạnh hàng loạt những trang bị đậm chất thể thao như: phuộc trước độc đáo, gác chân nhôm, tay dắt sau thể thao, ống xả cứng cáp và yên xe êm ái.
Khối động cơ mạnh mẽ hàng đầu phân khúc, hệ thống phun xăng điện tử hiện đại cùng hộp số 6 cấp, cam đôi DOHC 4 van làm mát bằng dung dịch mang đến khả năng tăng tốc vượt trội và tiết kiệm nhiên liệu hiệu quả.
Hệ thống chống bó cứng phanh ABS được trang bị cho bánh trước, hoạt động hiệu quả khi người lái bóp phanh trước, giúp ổn định tư thế của xe bằng cách chống khóa cứng bánh xe, đặc biệt trong điều kiện đường trơn ướt hay gồ ghề.
Sự tiện lợi tối đa cũng được thể hiện qua việc tích hợp công tắc mở yên với ổ khóa, giúp bạn thao tác dễ dàng trong những tình huống hàng ngày
Phiên bản phanh thường: 123kg Phiên bản phanh ABS: 124kg
Dài x Rộng x Cao: 2.019 x 727 x 1.088 mm
Khoảng cách trục bánh xe: 1.278 mm
Độ cao yên: 795 mm
Khoảng sáng gầm xe: 150 mm
Dung tích bình xăng: 4,5 lít
Kích cỡ lớp trước/ sau: Trước: 90/80-17M/C 46P; Sau: 120/70-17M/C 58P
Phuộc trước: Ống lồng, giảm chấn thủy lực',N'Đen', 6, N'xe40.png')
SET IDENTITY_INSERT [dbo].[Hang] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen], [TrangThai], [SoDienThoai], [Email]) VALUES (1, N'Trần Thị Hằng', N'hang2812', N'123456', 1, 1, N'0388244756', N'hang2812@gmail.com')
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen], [TrangThai], [SoDienThoai], [Email]) VALUES (2, N'Nguyễn Hà Hương Dịu', N'diu0210', N'123456', 1, 1, N'0357884689', N'diu0210@gmail.com')
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen], [TrangThai], [SoDienThoai], [Email]) VALUES (3, N'Phạm Thị Hoài', N'hoai123', N'12345678', 1, 1, N'0356678885', N'hoai123@gmail.com')
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen], [TrangThai], [SoDienThoai], [Email]) VALUES (4, N'Hà Thị Huệ', N'hue1234', N'12345', 1, 1, N'0355674677', N'hue1234@gmail.com')
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen], [TrangThai], [SoDienThoai], [Email]) VALUES (5, N'Nguyễn Thị Huyền Trang', N'trang234', N'23456', 1, 1, N'0346784467',N'trang234@gmail.com')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO

