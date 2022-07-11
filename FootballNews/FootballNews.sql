USE [master]
GO
/****** Object:  Database [FootballNews]    Script Date: 7/11/2022 8:46:04 PM ******/
CREATE DATABASE [FootballNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FootballNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FootballNews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FootballNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FootballNews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FootballNews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootballNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootballNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootballNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootballNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootballNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootballNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootballNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootballNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootballNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootballNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootballNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootballNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootballNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootballNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootballNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootballNews] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FootballNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootballNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootballNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootballNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootballNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootballNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootballNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootballNews] SET RECOVERY FULL 
GO
ALTER DATABASE [FootballNews] SET  MULTI_USER 
GO
ALTER DATABASE [FootballNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootballNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootballNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootballNews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FootballNews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FootballNews] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FootballNews', N'ON'
GO
ALTER DATABASE [FootballNews] SET QUERY_STORE = OFF
GO
USE [FootballNews]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[NewsId] [int] NULL,
	[Content] [nvarchar](4000) NULL,
	[Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](4000) NULL,
	[ImageId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](256) NULL,
	[NewsId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [int] NULL,
	[Title] [nvarchar](4000) NULL,
	[ShortDescription] [nvarchar](4000) NULL,
	[Thumbnail] [nvarchar](256) NULL,
	[CategoryId] [int] NULL,
	[DatePublished] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/11/2022 8:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[Password] [nvarchar](256) NULL,
	[Avatar] [nvarchar](256) NULL,
	[RoleId] [int] NULL,
	[Code] [nvarchar](256) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Quốc Tế')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Việt Nam')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Anh')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'TBN')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Đức')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Pháp')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Italia')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (8, N'Chuyển Nhượng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (1, N'Trận cầu tâm điểm vòng 5 V-League 2022 giữa CLB Bình Định và HAGL khép lại với tỷ số hòa 1-1. Đội khách phố Núi tiếp tục để lại màn trình diễn kém thuyết phục khi phải rất vất vả mới có được bàn gỡ những phút cuối trận, dù được thi đấu hơn người trong suốt cả hiệp 2.', 1)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (2, N'Có lợi thế về quân số nhưng lối chơi của HAGL tỏ ra vô cùng bế tắc, thậm chí nếu chính xác hơn, chủ nhà Bình Định có thể giữ lại 3 điểm trọn vẹn trên sân Quy Nhơn từ những pha phản công sắc sảo. Dẫu vậy, chia sẻ sau trận đấu, HLV Kiatisak của HAGL vẫn hài lòng với trận hòa nhọc nhằn mà ông cùng các học trò có được. ', 1)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (3, N'Trả lời báo giới, chiến lược gia người Thái Lan cho biết: "Một điểm là đúng mong đợi của chúng tôi. CLB Bình Định rất mạnh, lại được chơi trên sân nhà. Họ có HLV giỏi như ông Nguyễn Đức Thắng. Hai đội cũng từng đấu giao hữu nhiều với nhau nên khá hiểu rõ lẫn nhau. May mắn là đội bạn bị thẻ đỏ nên chúng tôi chơi hơn người.', 1)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (4, N'Kết quả hòa là công bằng với hai đội. HAGL muốn giành chiến thắng nhưng không dễ dàng khi đội bạn phòng ngự rất tốt. HAGL mất hai thủ môn, còn ngoại binh Brandao thì gặp vấn đề sức khỏe nên chúng tôi không có đủ ngoại binh. Tôi hài lòng khi đội có điểm và nỗ lực thi đấu".', 1)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (5, N'Tối ngày 2/7, U19 Việt Nam vừa có màn so tài với U19 Indonesia ở lượt đấu đầu tiên bảng A giải U19 Đông Nam Á 2022. Trên sân khách, thầy trò HLV Đinh Thế Nam đã có 1 điểm ở ngày ra quân và tạm đứng thứ 3 trên BXH.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (6, N'Sau trận này, U19 Việt Nam phải đón nhận tin không vui về mặt lực lượng. Trong một pha va phạm với cầu thủ U19 Indonesia ở hiệp 2, Anh Tú buộc phải rời sân. Tiền đạo này phải nhờ đồng đội cõng ra xe bus để trở về khách sạn sau trận hòa giữa U19 Việt  Nam và U19 Indonesia.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (7, N'Theo đánh giá ban đầu, Anh Tú bị lật cổ chân. Tuy nhiên, bác sĩ của U19 Việt  Nam cho rằng cần theo dõi để tiếp tục đánh giá tình trạng của chấn thương trước khi có thể chụp phim để xác định rõ hơn.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (8, N'Cũng theo bác sĩ của đội, khả năng ra sân của Anh Tú trong những trận đấu tới là rất thấp. Đây là thiệt thòi lớn cho  U19 Việt Nam. Trước đó, trung vệ Văn Triệu  cũng dính chấn thương, gần như không thể thi đấu các trận của vòng bảng.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (9, N'Như đã biết, U19 Việt Nam rơi vào bảng đấu có 6 đội bóng, đồng nghĩa với việc phải thi đấu đến 5 trận với mật độ 2 ngày/1 trận nên cần lực lượng đầy đủ nhất. Với 2 trường hợp trên bị chấn thương, quân số của U19 Việt Nam đảm bảo đủ sức khỏe để thi đấu còn 25 cầu thủ, trong đó có 3 thủ môn.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (10, N'Theo kế hoạch, U19 Việt Nam sẽ có buổi tập vào lúc 16h00 chiều 3/7 để chuẩn bị cho trận đấu với U19 Philippines vào lúc 15h00 ngày 4/7. Trận đấu diễn ra trên sân Madya Senayan, gần với khách sạn của thầy trò ông Đinh Thế Nam. Vì thế, thời  gian di chuyển sẽ ngắn hơn so với việc phải đến sân Patriot Candrabhga vốn mất 1 tiếng đồng hồ dưới sự hộ tống của lực lượng dẫn đường.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (11, N'Sau đó, U19 Việt Nam sẽ lần lượt gặp các đối thủ tiếp theo là Brunei, Myanmar và Thái Lan.', 2)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (12, N'Ở những phút cuối hiệp 1 trận đấu giữa CLB Bình Định và Hoàng Anh Gia Lai trong khuôn khổ vòng 5 V-League 2022, khi Bình Định đang dẫn 1-0 thì tình huống mang tính bước ngoặt xuất hiện.', 3)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (13, N'Cụ thể, thủ môn Vũ Tuyên Quang của CLB Bình Định đã pha phạm lỗi với Văn Toàn ở ngoài vùng cấm khi cố gắng sửa sai cho trung vệ Dương Thanh Hào. Thanh Hào xử lý lỗi trong một pha bóng đơn giản và để Văn Toàn cướp được bóng. Tình huống này đã khiến trọng tài quyết định ra thẻ đỏ cho Tuyên Quang.', 3)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (14, N'Để bảo vệ thủ môn Vũ Tuyên Quang không phải lãnh thẻ đỏ, hậu vệ Hồ Tấn Tài khiến trọng tài chính giật mình khi giật chiếc thẻ đỏ ra khỏi tay ông. Sau đó, cầu thủ này giấu thẻ sau lưng nhưng bị phát hiện. Trọng tài đã lấy lại thẻ và cảnh cáo anh, đồng thời vẫn giữ quyết định rút thẻ đỏ cho thủ môn. Đồng thời hành động này của Hồ Tấn Tài còn khiến anh "lĩnh" 1 thẻ vàng. ', 3)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (15, N'Rất may, tình huống này diễn ra ngoài vùng cấm địa nên CLB Bình Định không bị phạt penalty. Khi đó, đội chủ nhà đang dẫn HAGL 1-0 bằng bàn thắng của tiền vệ Phạm Văn Thành ở phút 19. Sau đó, họ chỉ còn chơi với 10 người từ phút 40. Đến phút 86, ngoại binh Washington Brandao ghi bàn gỡ hòa bằng cú đánh đầu cận thành cho đội khách HAGL. Hai đội phải chia điểm trong trận đấu ở vòng 5 V.League 2022. ', 3)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (16, N'Chia sẻ về tình huống khiến thủ môn Vũ Tuyên Quang phải nhận thẻ đỏ, HLV trưởng của CLB Bình Định, ông Nguyễn Đức Thắng cũng không trách cứ gì cậu học trò của mình: "Tôi nghĩ trong pha bóng đó, bóng rời dựng đứng từ trên cao cộng với ánh đèn nên cầu thủ sai lầm. Đó là tai nạn trong bóng đá, chúng tôi phải chấp nhận và tôi không trách cứ."', 3)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (17, N'Ở trận đấu này, CLB Bình Định lãnh 3 thẻ vàng (Hồ Tấn Tài, Rafaelson, Nguyễn Xuân Nam và một thẻ đỏ trực tiếp cho Vũ Tuyên Quang), HAGL không bị phạt thẻ nào. Ở lượt đấu tới, HAGL sẽ tiếp CLB Đà Nẵng còn đội chủ sân Quy Nhơn gặp CLB Sài Gòn ở sân Thống Nhất.', 3)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (18, N'Giải U19 Đông Nam Á là giải bóng đá trẻ được tổ chức thường niên mỗi năm một lần. Giải đấu đầu tiên được tổ chức vào năm 2002 tại Campuchia và Thái Lan là đội lên ngôi vô địch đầu tiên. Trước năm 2008, giải đấu dành cho lứa cầu thủ U20 và có tên gọi là U20 Đông Nam Á và tới mùa giải 2008 đã chính thức được đổi thành giải U19 Đông Nam Á và cho các cầu thủ dưới 19 tuổi tham dự.', 4)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (19, N'Tính đến mùa giải 2022, giải đấu đã trải qua 17 lần tổ chức và xét về thành tích chung, Thái Lan đang dẫn  đầu với 5 lần lên ngôi vương (2002, 2009, 2011, 2015, 2017), 2 lần về nhì (2010, 2016) và 3 lần về thứ 3 (2006, 2007 và 2014). Tuy nhiên lần gần nhất U19 Thái Lan lọt vào trận chung kết đã từ mùa giải 2017 và năm đó họ đã lên ngôi vô địch.', 4)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (20, N'Xếp thứ 2 về thành tích qua các năm là Australia với cùng 5 lần lên ngôi vô địch (2006, 2008, 2010, 2016, 2019), 1 lần Á quân (2009) và 1 lần về thứ 3 (2012). Australia cũng đang là đương kim vô địch của giải đấu khi họ lên ngôi vương tại giải đấu gần nhất được tổ chức vào năm 2019. Trong trận chung kết, U19 Australia đánh bại U19 Malaysia với tỷ số 1-0.', 4)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (21, N'Xếp thứ 3 là Myanmar với 2 lần lên ngôi vương vào các năm 2003 và 2005. Xếp sau đó lần lượt là Malaysia, Việt Nam, Indonesia và Iran, Nhật Bản với cùng 1 lần lên ngôi vô địch. U19 Việt Nam mới chỉ có 1 lần lên ngôi vương vào năm 2007, khi giải đấu vẫn còn là U20 Đông Nam Á. Ngoài ra, những cầu thủ trẻ Việt Nam có 4 lần về nhì (2011, 2013, 2014, 2015) ', 4)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (22, N'Số lần vô địch của U19 Việt Nam chỉ bằng với U19 Nhật Bản và U19 Iran, 2 đội bóng khách mời ở các năm 2014 và 2012. Cụ thể vào mùa giải 2012, chỉ có 3 đội bóng dự giải cùng Việt Nam là U19 Iran, U19 Uzbekistan và U19 Australia. Iran lên ngôi vô địch năm đó trong khi chủ nhà Việt Nam xếp cuối cùng.', 5)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (23, N'Còn ở mùa giải 2014, U19 Nhật Bản đã đánh bại U19 Việt Nam của lứa cầu thủ như Văn Toàn, Công Phượng, Tuấn Anh, Xuân Trường trong trận chung kết để lên ngôi vô địch. ', 5)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (24, N'CLB Viettel vừa hoàn thành vòng bảng AFC Cup 2022 đúng như kỳ vọng với ngôi nhất bảng I cùng tấm vé vào chơi trận bán kết khu vực Đông Nam Á, chạm trán Kuala Lumpur FC (Malaysia). Trước khi hướng đến màn so tài ở đấu trường châu lục, đội bóng áo lính sẽ tiếp tục hành trình tại V-League 2022.', 6)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (25, N'Mới đây, CLB Viettel đã có sự bổ sung vô cùng cần thiết về nhân sự trước trận gặp Hồng Lĩnh Hà Tĩnh ở vòng 5 V-League 2022. Theo đó, nhà đương kim vô địch sẽ đón chào sự trở lại của HLV trưởng Trương Việt Hoàng sau thời gian nghỉ phép, cùng hậu vệ trẻ Phan Tuấn Tài từ CLB cho mượn Đắk Lắk (hạng Nhì).', 6)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (26, N'Trên trang mạng xã hội chính thức, CLB Viettel đăng tải hình ảnh HLV Trương Việt Hoàng trực tiếp chỉ đạo buổi tập chiều ngày 2/7 tại đại bản doanh của đội bóng. Đây là tín hiệu rất đáng mừng cho đội bóng áo lính trước những tin đồn về tương lai của nhà cầm quân này thời gian qua.', 6)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (27, N'Trước đó, HLV Trương Việt Hoàng được cho là bất ngờ quyết định chia tay CLB Viettel ngay trước thềm vòng bảng AFC Cup 2022. Tại đấu trường châu lục, giữ cương vị HLV trưởng CLB Viettel là trợ lý thể lực Bae Ji Won - người có bằng HLV Pro theo quy định của LĐBĐ Châu Á (AFC) trong khi ông Hoàng chưa có bằng này.', 7)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (28, N'Động thái đăng ký thay đổi vị trí HLV trưởng của CLB Viettel đến vào thời điểm HLV Trương Việt Hoàng xin nghỉ phép khiến những tin đồn về khả năng "đường ai nấy đi" được bàn tán. Tuy nhiên, sự trở lại của chiến lược gia 46 tuổi đã xóa tan những hoài nghi về việc rời CLB Viettel.', 7)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (29, N'Về phần Phan Tuấn Tài, hậu vệ sinh năm 2001 sẽ được CLB Viettel đăng ký thi đấu trong giai đoạn 2 V-League 2022, sau màn thể hiện chói sáng cùng U23 Việt Nam tại VCK U23 châu Á vừa qua. ', 7)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (30, N'Vào lúc 19h15 ngày 4/7, CLB Viettel sẽ tiếp đón CLB Hồng Lĩnh Hà Tĩnh tại vòng 5 V-League 2022 trên sân nhà Hàng Đẫy. Hiện CLB Viettel đang có 7 điểm sau 4 vòng đấu và tạm thời đứng thứ 3 trên bảng xếp hạng.', 7)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (31, N'Việc Ronaldo tuyên bố muốn rời MU khiến Quỷ đỏ đang phải gấp rút tìm người thay thế. The Sun đưa tin, đội chủ sân Old Trafford đã nhắm tới cầu thủ chạy cánh của Bayern Munich , Serge Gnabry.', 8)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (32, N'Tuy nhiên, Man City được cho là cũng quan tâm đến tuyển thủ Đức . Với việc Raheem Sterling được liên hệ chuyển tới Chelsea, Gnabry đã được liệt vào danh sách mục tiêu của Pep Guardiola để gia cố hàng công của City mùa sau.', 8)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (33, N'Gnabry chỉ còn 1 năm hợp đồng với Bayern và đã từ chối gia hạn. Do đó, nhiều khả năng Hùm xám sẽ phải để anh ra đi với giá 35 triệu euro nếu không muốn mất trắng vào năm sau.', 8)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (34, N'Như Foot Mercato đưa tin tuần qua, PSG muốn bán trung vệ Kimpembe với giá 50 triệu euro. Chelsea và Juventus là những đội đang quan tâm.', 9)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (35, N'Theo thông tin mới nhất từ AS, Atletico MAdrid là đại diện mới nhất tham gia cuộc đua giành trung vệ người Pháp. CLB này đang tìm kiếm một cái tên chất lượng để thay thế cho Mario Hermoso, người có khả năng ra đi trong hè này.', 9)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (36, N'Hiện tại Chelsea đang là ứng cử viên hàng đầu trong cuộc đua giành trung vệ người Hà Lan từ Juventus. Và động thái mới nhất của Lão bà cho thấy việc De Ligt chia tay Turin để chuyển tới Anh có lẽ chỉ còn là vấn đề thời gian.', 10)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (37, N'Theo La Stampa, Juventus đang đẩy mạnh việc ký hợp đồng với Kalidou Koulibaly để chuẩn bị cho cuộc sống mà không có Matthijs De Ligt. Napoli cũng sẵn sàng bán hậu vệ này vì anh đã 31 tuổi chỉ còn một năm hợp đồng.', 10)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (38, N'Tờ Mirror cho biết, tiền đạo Firmino đang muốn ra đi để được ra sân nhiều hơn nhằm cơ hội được dự World Cup 2022 cùng ĐT Brazil vào cuối năm. Chân sút người Brazil đã bước vào năm cuối hợp đồng và đang được Juventus để ý.', 11)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (39, N'Lão bà được cho là sẵn sàng đưa tiền vệ Adrien Rabiot vào như một phần của thỏa thuận. Với việc bổ sung Darwin Nunez trong hè năm nay, mùa trước là Luis Diaz, Liverpool có thể sẽ bán Firmino vào hè này thay vì mất trắng anh vào đầu năm sau.', 11)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (40, N'Arsenal đang cạnh tranh với Manchester United để được hậu vệ Lisandro Martinez, người được Ajax định giá khoảng 43 triệu bảng. Pháo thủ đã 2 lần gửi đề nghị tới CLB Hà Lan nhưng đều bị từ chối, với lần gần nhất là 34 triệu bảng kèm 4 triệu phụ phí', 12)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (41, N'Quỷ đỏ được cho là đã đưa ra mức giá 34,5 triệu bảng kèm theo đó là 4 triệu bảng phụ phí, nhưng họ có sự hỗ trợ của Erik ten Hag - người cũ của Ajax.', 12)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (42, N'Theo Athletic, để vượt mặt MU, Arsenal sẽ tới gặp trực tiếp phía Ajax để đàm phán hợp đồng. Đôi bên đều cho rằng điều khoản cá nhân không phải là vấn đề.', 12)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (43, N'Sau khi chia tay bộ đôi Antonio Rudiger và Andreas Christensen, Chelsea đang ráo riết săn lùng những trung vệ chất lượng để gia cố hàng thủ mùa tới. Mục tiêu hàng đầu mà The Blues nhắm tới chính là Matthijs De Ligt của Juventus.', 13)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (44, N'Trung vệ người Hà Lan năm nay mới 23 tuổi và được giới chuyên môn đánh giá sẽ trở thành trung vệ xuất sắc nhất thế giới trong tương lai. De Ligt sở hữu mọi phẩm chất của một cầu thủ phòng ngự hiện đại như sức mạnh, tốc độ, khả năng chơi chân và đặc biệt là tài phán đoán tình huống. Nhờ đó, anh nhận được sự quan tâm của hàng loạt ông lớn tại châu Âu, trong đó ứng cử viên số 1 là Chelsea.', 13)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (45, N'The Blues được cho là đã đề nghị Juventus số tiền 70 triệu Euro, thậm chí còn kèm theo một trong hai tiền đạo Timo Werner hoặc Christian Pulisic để đổi lấy De Ligt. Bản thân Lão bà cũng không muốn cố chấp giữ De Ligt nhưng muốn thu về tối đa lợi nhuận từ thương vụ này nên chưa vội gật đầu.', 13)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (46, N'Tuy nhiên, động thái mới nhất của Bianconeri sẽ mang tin vui đến với các CĐV Chelsea. Theo La Stampa, Juventus đang thúc đẩy việc chiêu mộ Kalidou Koulibaly từ Napoli để chuẩn bị cho một cuộc sống không có De Ligt.', 13)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (47, N'Tuyển thủ người Senegal sở hữu bộ kỹ năng phòng ngự xuất sắc và đã có kinh nghiệm chinh chiến tại Serie A kể từ năm 2014. Anh được đánh giá là một trong những trung vệ hay nhất nước Ý ở thời điểm hiện tại và sẽ là sự thay thế hoàn hảo cho De Ligt. Koulibaly chỉ còn một năm hợp đồng với Napoli và được định giá khoảng 40 triệu euro, chỉ chiếm khoảng một nửa những gì mà Juventus có thể thu về từ việc bán ngôi sao người Hà Lan.', 14)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (48, N'Gần đây Koulibaly cũng được liên hệ để chuyển tới Chelsea trong trường hợp họ thất bại với thương vụ De Ligt. Tuy nhiên với động thái mới nhất từ Juventus, nhiều khả năng tuyển thủ người Senegal sẽ cập bến Turin và người đàn em sẽ chuyển tới khoác áo The Blues và mùa tới.', 14)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (49, N'Nếu hai thương vụ trên thực sự diễn ra thì sẽ là điều tốt cho cả 4 bên, Chelsea, Juventus, De Ligt và Koulibaly.', 15)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (50, N'Tuy nhiên, sẽ rất thú vị khi xem liệu chủ tịch Aurelio De Laurentiis của Napoli có trừng phạt Koulibaly vì chuyển đến Juventus hay không. Hai đội bóng cùng chung nhóm 7 chị em Serie A vốn là kình địch lâu năm. Hồi 2016, các CĐV Napoli từng biểu tình phản đối đội bóng vì đã để cho chân sút số 1 lúc bấy giờ là Higuain gia nhập "Bà đầm già".', 15)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (51, N'Arsenal đang khiến người hâm mộ phấn khích vì hoạt động tích cực trên TTCN hè này. Tính đến thời điểm hiện tại, họ đã chốt xong 3 tân binh và nhiều khả năng đón bản hợp đồng thứ 4 trong vài ngày tới. Gabriel Jesus đang trên đường đến Emirates khi mọi thỏa thuận vốn dĩ đã được thông qua.', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (52, N'Dù vậy, kế hoạch tuyển binh của Pháo thủ chưa dừng lại trong bối cảnh phiên chợ hè 2022 vẫn mở cửa. Arsenal được cho còn muốn chiêu mộ Raphinha và đặc biệt nhất là Youri Tielemans thuộc biên chế Leicester City. Thông tin Arsenal muốn có Tielemans đã được lan truyền hơn một tháng qua.', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (53, N'Đội bóng thành London hoàn toàn đủ khả năng giành chữ ký của ngôi sao người Bỉ bởi anh không hứng thú với việc gia hạn hợp đồng mới ở sân King Power. Leicester cần nhanh chóng bán trụ cột vào hè này để tránh viễn cảnh mất trắng. ', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (54, N'Cựu cầu thủ AS Monaco đồng thời được tiết lộ muốn đến Arsenal. Nhiều yếu tố đang ủng hộ Mikel Arteta dẫn dắt tiền vệ sinh năm 1997 vào mùa giải tới nhưng Arsenal đang khiến mọi thứ bị trì trệ. Sự chậm chạp này nhiều khả năng làm đội chủ sân Emirates ôm hận.', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (55, N'Theo nguồn tin từ nhà báo Ben Jacobs, Giám đốc thể thao bên phía Newcastle đã có buổi nói chuyện với phía Leicester để tìm hiểu về khả năng mua Tielemans. Nếu Newcastle cảm thấy Leicester đưa ra những yêu cầu hợp lý, họ sẽ tham gia vào cuộc đua giành chữ ký của cầu thủ người Bỉ. ', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (56, N'Chích chòe không phải chướng ngại duy nhất dành cho Arsenal ở thương vụ này. West Ham United cũng được cho hứng thú với Tielemans khi David Moyes ngưỡng mộ ngôi sao 25 tuổi. Những động thái của 2 đội bóng Premier League vừa nêu là lời cảnh báo dành cho Arsenal.', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (57, N'Họ có thể mất mục tiêu số một ở hàng tiền vệ nếu tiếp tục trì hoãn quá trình đàm phán với Tielemans. Ngay cả khi thương vụ Jesus hoàn thành, Arsenal vẫn khó lòng dành sự tập trung cho mỗi Tielemans. Lisandro Martinez đang trở thành mục tiêu tranh giành giữa đội bóng London và Manchester United. ', 16)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (58, N'Đêm qua, báo giới châu Âu đưa tin Ronaldo đã yêu cầu BLĐ MU bán anh vào mùa hè này nếu nhận được một lời đề nghị thỏa đáng. Trong bối cảnh đó, nhiều ông lớn đã bắt đầu rục rịch săn đón siêu sao người Bồ Đào Nha.', 17)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (59, N'Theo The Athletic, Chelsea, Bayern Munich và Napoli là những đội đang quan tâm tới việc ký hợp đồng với siêu sao của Man Utd. Trong khi đó, PSG hiện không có hứng thú theo đuổi Ronaldo.', 17)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (60, N'Theo Fabrizio Romano, PSG sẵn sàng để trung vệ Presnel Kimpembe ra đi vào mùa hè này. Tuyển thủ Pháp từng vô địch World Cup 2018 không nằm ngoài kế hoạch của CLB nhưng đội bóng vẫn có thể bán anh nếu nhận được lời đề nghị phù hợp. Kimpembe hiện đang được liên hệ chuyển tới Chelsea, nơi anh sẽ được tái hợp với thầy cũ Thomas Tuchel.', 18)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (61, N'Bất chấp những thông tin cho rằng Man Utd đã đạt thỏa thuận chiêu mộ tiền vệ Frenkie De Jong, mới đây Chủ tịch Laporta của Barca lại khẳng định MU không phải CLB duy nhất muốn có tiền vệ người Hà Lan. Ngoài ra ông cũng tuyên bố sẽ tìm mọi cách để giữ De Jong ở lại.', 19)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (62, N'Gần đây, có thông tin cho rằng Chelsea sẵn sàng gia nhập cuộc đua giành Frenkie De Jong trong trường hợp cuộc đàm phán cá nhân giữa anh và MU đổ bể.', 19)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (63, N'Theo tờ Record của Bồ Đào Nha, Arsenal đã liên hệ với Benfica để hỏi mua hậu vệ trái Alex Grimaldo. HLV Mikel Arteta rất muốn có một người thay thế cho Kieran Tierney, trong bối cảnh Nuno Tavares tỏ ra thiếu ổn định kể từ khi gia nhập CLB vào năm ngoái.', 20)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (64, N'Pháo thủ dự kiến có thể chiêu mộ Grimaldo với giá rẻ bởi anh chỉ còn 1 năm hợp đồng với Benfica. Đội bóng Bồ Đào Nha được cho là sẵn sàng chia tay cựu cầu thủ của học viện Barcelona nếu nhận được từ 6-7 triệu bảng.', 20)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (65, N'Chỉ một ngày sau khi bán Richarlison cho Tottenham, Everton đã có cho mình bản hợp đồng đầu tiên mang tên James Tarkowski. Cầu thủ người Anh chuyển tới sân Goodison Park theo dạng tự do sau khi chia tay Burnley.', 21)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (66, N'Tarkowski sẽ ký hợp đồng 4 năm và nhận áo số 2 tại CLB mới. Được biết, anh đã nhận được rất nhiều lời đề nghị của các CLB Ngoại hạng Anh nhưng từ chối tất cả để đầu quân cho HLV Lampard.', 21)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (67, N'Trang chủ của MU và Nottingham Forest vừa đưa ra thông báo chính thức về việc 2 CLB này đã đạt được thỏa thuận chuyển nhượng Dean Henderson. Cụ thể, thủ môn 25 tuổi gia nhập đội chủ sân City Ground với bản hợp đồng cho mượn có thời hạn trong một mùa giải. Một điều khoản đáng chú ý trong hợp đồng này là Henderson không được thi đấu cho Nottingham Forest khi đội bóng này đối đầu MU.  ', 22)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (68, N'Theo lịch thi đấu Ngoại Hạng Anh 2022/23, Nottingham Forest đá 2 trận gặp Quỷ đỏ vào ngày lễ tặng quà (Boxing Day) và ngày 15/4 năm sau. Henderson chắc chắn phải vắng mặt trong 2 trận đấu này. Hợp đồng cho mượn của thủ thành người Anh sẽ có hiệu lực ngay lập tức. Henderson cũng sẽ tham dự chuyến tập huấn sắp tới của Nottingham Forest tại Tây Ban Nha. ', 22)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (69, N'Ở mùa bóng trước, Henderson chỉ có vỏn vẹn 3 lần ra sân trong màu áo MU. Người gác đền mang áo số 26 không thể cạnh tranh một vị trí chính thức khi David De Gea chơi quá ấn tượng. Còn với Nottingham Forest, CLB này vừa giành quyền thăng hạng sau khi hạ gục Sheffield United và Huddersfield Town ở vòng play-offs của giải hạng nhất Anh 2021/22. Việc hỏi mượn Dean Henderson từ MU là động thái nhằm tăng cường lực lượng của Nottingham Forest, phục vụ cho mục tiêu trụ hạng ở mùa 2022/23. ', 23)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (70, N'Tuyển Hàn Quốc vào chung bảng với Bồ Đào Nha, Ghana và Uruguay ở vòng chung kết World Cup 2022. Đây được đánh giá là bảng đấu rất nặng của đại diện châu Á. Với Son, anh có cơ hội tái ngộ Ronaldo. Mùa trước, cả hai chạm mặt nhau tại Ngoại hạng Anh.', 24)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (71, N'Nhận định về những đối thủ còn lại trong bảng đấu, Son nói: "Tất cả đều như nhau. Ghana và Uruguay là những đội có lối chơi khó chịu. Tôi hào hứng và cũng khá lo".', 24)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (72, N'Nói thêm về sự chuẩn bị cho World Cup, Son chia sẻ: "Điều làm tôi vui nhất là cả đội có vé dự World Cup. Tại sân chơi lớn này, tôi muốn cống hiến những thứ tốt nhất của mình. Với các đồng đội, tôi muốn nhắn rằng hãy tận hưởng bầu không khí tuyệt với đó. Hy vọng mọi người sẽ chơi bóng với tâm trạng thoải mái nhất".', 24)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (73, N'Son cũng kể thêm về mối quan hệ với huyền thoại tuyển Hàn Quốc, Park Ji-sung. Chân sút của Tottenham nói: "Tôi có những kỷ niệm đẹp với anh ấy. Tôi xem Park Ji-sung là hình mẫu để noi theo. Tại Asian Cup 2011, chúng tôi là bạn chung phòng. Tuy nhiên, tôi không thể ngủ được. Anh ấy để lại tầm ảnh hưởng lớn trên sân cỏ. Park Ji-sung biết cách duy trì thể trạng tốt nhất".', 24)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (74, N'Trong một diễn biến khác, Givemesport vừa kết hợp cùng Ranker để tạo ra cuộc bầu chọn trực tuyến cho cộng đồng cổ động viên Tottenham, nhằm chọn ra 50 gương mặt xuất sắc có đóng góp to lớn cho đội bóng. Kết quả, Son giữ vị trí số một. Trong 7 mùa thi đấu cho Tottenham, Son ghi 131 bàn sau 325 trận.', 24)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (75, N'"Tôi không biết tương lai sẽ như thế nào", Messi nói vào mùa hè năm ngoái. "Có lẽ phải chờ đến khi tôi kết thúc hợp đồng hiện tại với PSG (tháng 6/2023 - PV)". Khác Cristiano Ronaldo, Messi không phải mẫu cầu thủ thích những thông điệp đao to búa lớn hay tranh đấu trên đỉnh cao bằng mọi giá. Leo biết mình bước vào hoàng hôn của sự nghiệp.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (76, N'Emiliano Martinez kể lại trước chung kết Copa America 2021, Messi thừa nhận với cả đội rằng cuộc đối đầu Brazil khi đó có thể là trận cuối cùng của Leo trong màu áo "Albiceleste". "Khi Messi nói rằng đây có thể là trận đấu cuối cùng của anh ấy cho ĐTQG, tất cả đều xúc động", thủ môn Aston Villa tiết lộ. "Đến Tổng thống Argentina khi đó cũng im lặng nghe anh ấy nói".', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (77, N'Thành công cùng tuyển Argentina là thứ Messi ao ước bậc nhất trong sự nghiệp. Mong ước đó càng lớn hơn với Leo khi anh bước sang tuổi xế chiều của đời cầu thủ.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (78, N'Siêu sao người Argentina giải cơn khát trong màu áo ĐTQG với chức vô địch Copa America 2021, danh hiệu anh thừa nhận có ý nghĩa lớn trong sự nghiệp cầu thủ. Tuy nhiên, nếu được lựa chọn một điều ước trong ngày sinh nhật tuổi 35, Leo nhiều khả năng sẽ nghĩ về nấc thang tiếp theo cùng ĐTQG. Đó là vô địch World Cup 2022.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (79, N'Messi đón sinh nhật 35 tuổi với gia đình ở Ibiza. Vài tuần trước, siêu sao sinh năm 1987 lập cú "poker" trong chiến thắng 5-0 của Argentina trước Estonia để vươn lên xếp thứ 4 trong danh sách các cầu thủ ghi bàn nhiều nhất cấp ĐTQG. Messi lúc này có 86 bàn, kém người dẫn đầu Cristiano Ronaldo (có 117 bàn). Không lâu trước đó, Leo tỏa sáng trong chiến thắng thuyết phục 3-0 của Argentina trước Italy.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (80, N'"Nếu World Cup khởi tranh từ bây giờ, chúng ta và Leo sẽ vô địch", Ole cao hứng giật tít sau trận Siêu cúp Liên lục địa. Jorge Valdano nhận xét chưa bao giờ ông ấy Messi hạnh phúc trong màu áo ĐTQG như một năm qua. Chức vô địch Copa America 2021 thay đổi nhiều thứ, và với Messi, trạng thái tâm lý thoải mái khi chơi bóng cho "Albiceleste" có ý nghĩa lớn.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (81, N'Rất khó để tin rằng sau 4 năm nữa, trên đất Mỹ và Canada, huyền thoại của Barca vẫn thống lĩnh hàng công tuyển Argentina ở World Cup 2026. Messi khao khát tỏa sáng trong kỳ World Cup gần như cuối cùng trong sự nghiệp của anh. Argentina chắc chắn nằm trong số những ứng viên hàng đầu cho chức vô địch World Cup 2022.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (82, N'Leo từng tiến gần đến danh hiệu cao quý bậc nhất cấp ĐTQG vào năm 2014, nhưng như một sự sắp đặt oan nghiệt của số phận, anh không thể hoàn tất bộ sưu tập danh hiệu.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (83, N'Cũng trong ngày sinh nhật tuổi 35 của mình, Leo nhận hai lời chúc quan trọng. Một, từ đội bóng anh đang khoác áo, PSG. Hai, từ đội bóng cũ Barca.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (84, N'"Chúc mừng sinh nhật", tài khoản mạng xã hội của Barca viết trên trang cá nhân, đăng kèm bàn thắng tuyệt vời Messi ghi được vào lưới Manchester United trong trận chung kết Champions League 2011 trên sân Wembley. Điều đó như một lời nhắc nhở cho nhiều người hâm mộ thấy rằng đội bóng xứ Catalonia và Messi vẫn có mối liên kết đặc biệt sau những gì cả hai từng trải qua.', 25)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (85, N'Cuối năm ngoái, vài tháng sau khi rời Camp Nou, Leo thừa nhận anh muốn trở lại Barca một ngày nào đó để giúp đội bóng anh yêu quý. Câu chuyện về bến đỗ tiếp theo của Leo khi anh bước sang tuổi 35 cũng là thứ được thế giới bóng đá quan tâm.', 26)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (86, N'PSG cũng muốn tham gia vào ngày đặc biệt của tiền đạo người Argentina. Nhà vô địch nước Pháp hy vọng Messi sẽ có "một năm tràn ngập niềm vui". Cựu Giám đốc Thể thao PSG, Leonardo thừa nhận chiêu mộ được Messi là thành công lớn nhất của ông khi nắm quyền ở CLB nước Pháp. "Đó là một Olympus của bóng đá, của những người quản lý thể thao", cựu danh thủ người Brazil khẳng định.', 26)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (87, N'PSG sẵn sàng làm tất cả để Leo hài lòng. Trong hợp đồng có thời hạn hai năm giữa CLB nước Pháp và cầu thủ, có điều khoản cho phép Messi ưu tiên phục vụ ĐTQG hơn PSG. Người Qatar muốn Messi hạnh phúc và có vẻ như họ thành công với điều đó.', 26)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (88, N'Tất nhiên, khó có thể biết được liệu Messi có tiếp tục thi đấu cho PSG khi mùa giải 2022/23 kết thúc hay không. Bản thân Leo cũng thừa nhận anh chưa muốn đưa ra quyết định. Màn trình diễn của PSG và Messi trong mùa giải tới có lẽ sẽ đóng vai trò quan trọng đến tương lai của siêu sao này. Nếu PSG giúp Messi thỏa giấc mơ vô địch Champions League có thể là cuối cùng trong sự nghiệp, Leo sẵn sàng ở lại hoặc chọn một bến đỗ khác để "dưỡng già".', 26)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (89, N'Từ Trung Đông hay Mỹ, những lời mời gọi Leo về chơi bóng không thiếu. Siêu sao người Argentina cũng không phải mẫu cầu thủ có khao khát trụ lại đỉnh cao mãnh liệt như Ronaldo. Sự bình yên và niềm hạnh phúc khi chơi bóng mới là thứ Messi quan tâm nhất, chứ không hẳn là những bàn thắng hay kỷ lục cá nhân.', 26)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (90, N'Tương lai và lựa chọn của Messi khi bước sang tuổi 35 là thứ được thế giới bóng đá quan tâm. Người yêu mến Leo hy vọng anh sẽ tiếp tục chơi bóng ở đẳng cấp cao nhất đến khi nào còn có thể. Tuy nhiên, nếu Leo cảm thấy đến lúc anh nên lùi lại phía sau, điều đó không có gì bất ngờ.', 26)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (91, N'Đây là quyết định được Liên đoàn Bóng đá Thế giới (FIFA) phê duyệt vào ngày hôm qua (23/6). Việc nới lỏng các quy định để giảm bớt khó khăn các CLB, đội tuyển trước tình hình dịch Covid-19. Bên cạnh đó, các đội tuyển cũng sẽ được thay 5 người, gói gọn trong 3 lượt dừng trận đấu.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (92, N'Trước đó, việc tăng số cầu thủ đăng ký cho mỗi trận đã được UEFA thực hiện ở EURO 2020. Tại các giải đấu ở châu Mỹ, châu Phi (Copa America, CAN), các đội tuyển còn được đăng ký đến 28 người.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (93, N'Theo Washingtonpost, việc tăng số cầu thủ đăng ký giúp các huấn luyện viên của 32 đội tuyển dự World Cup có thêm phương án dự phòng cho các trường hợp bất ngờ nhiễm Covid-19. Các cầu thủ cũng được yêu cầu tự bảo vệ bằng cách tuân theo các quy trình chăm sóc sức khỏe của nước chủ nhà Qatar.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (94, N'Sự thay đổi của FIFA sẽ tạo thêm cơ hội dự World Cup cho tổng cộng 96 cầu thủ. Ngày hội bóng đá thế giới năm nay diễn ra trong 28 ngày, bắt đầu từ ngày 21/11 đến 18/12, ít hơn 4 ngày so với World Cup 2018 tại Nga.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (95, N'Trước đó, FIFA cũng xác nhận đưa vào sử dụng hệ thống Trí tuệ Bóng đá Nâng cao để phân tích màn trình diễn của cầu thủ tại World Cup 2022.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (96, N'Những đường chuyền hay các cú sút của Lionel Messi và Cristiano Ronaldo tại World Cup 2022 sẽ được phân tích dưới một hệ thống hoàn toàn mới từ FIFA. Nhiều năm qua, đội ngũ Phân tích và Nghiên cứu Bóng đá FIFA đã phát triển hệ thống Trí tuệ Bóng đá Nâng cao (Enhanced Football Intelligence - EFI) cho phép phân tích và đánh giá các trận đấu theo thời gian thực.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (97, N'Các CLB tại châu Âu sẽ bắt đầu nhả người từ ngày 13/11. Theo đó, thay vì 2 tuần như thường lệ, cầu thủ sẽ chỉ còn một tuần tập luyện trước khi bước vào World Cup 2022.', 27)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (98, N'Hơn nửa thế kỷ. Năm mươi hai năm đã trôi qua và kỷ niệm của nó đã đi vào lịch sử với tư cách là Giải vô địch thế giới hay nhất mọi thời đại. World Cup vĩnh cửu. Vĩnh viễn. Vô hạn. Giải vô địch bóng đá thế giới của Pele. Hoặc tương tự, đó là bộ ngũ ngôi sao được huấn luyện viên Mario Zagallo tập hợp trong một hàng tiền đạo thần thoại: Jairzinho - Gerson - Tostao - Pele - Rivelino.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (99, N'Mexico 1970 - diễn ra từ 31/5 đến 21/6 - nhiều hơn nhiều so với bất kỳ World Cup nào về những khoảnh khắc chói sáng từng thấy. Nó cũng là của cái gọi là Trận đấu của Thế kỷ ("El partido del siglo", theo tiếng Tây Ban Nha ở Mexico; "Partita del Secolo" trong tiếng Italy; hoặc tiếng Đức "Jahrhundertspiel"). Trận bán kết giữa Italy và Đức được giải quyết trong hiệp phụ với năm bàn thắng. Chiến thắng nghẹt thở của Azzurri (4-3) đã tránh được sự xuất hiện của đồng xu trong không khí, trong khi Franz Beckenbauer xuất sắc rời sân vận động Azteca với một cánh tay trong chiếc địu.', 28)
GO
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (100, N'Giải đấu này sẽ luôn được khơi dậy vì trở thành cuộc cạnh tranh cho những đổi mới về quy định và công nghệ tuyệt vời, cũng như những kỳ tích trong bóng đá: 10 bàn thắng của Gerd Muller; Jairzinho ghi 7 bàn, một bàn mỗi trận; pha cứu thua của Gordon Banks trong khung thành đội tuyển Anh và phát hiện ra một thanh niên 21 tuổi tên Teofilo Cubillas - người được Pele chỉ định như người kế nhiệm của ông ngay tại chỗ. Sự cam kết đặc biệt của bóng đá tấn công, ngay cả ở các đội tuyển tầm trung, khiến Mexico 1970 trở thành giải đấu ghi nhiều bàn nhất trong sáu thập kỷ qua với trung bình gần 3 bàn thắng (2,97) mỗi trận: 95 bàn trong 32 trận.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (101, N'Teofilo Cubillas (năm nay 73 tuổi) người Peru và Victor Esparrago (77 tuổi) người Uruguay đóng vai chính trong phần lớn truyện ngụ ngôn của giải vô địch thế giới ấy và chứng minh từ kinh nghiệm quốc tế phong phú của họ rằng đó là sự kiện xuất sắc của World Cup. Cubillas tự hào về việc tham dự 3 kỳ World Cup (1970, 1978 và 1982) đã chứng kiến trực tiếp "tất cả những giải đấu khác và chưa bao giờ có một sự kiện như vậy".', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (102, N'"Không chỉ Brazil, vốn đã rất mạnh", huyền thoại người Peru - cầu thủ trẻ xuất sắc nhất giải đấu mà Mexico lần đầu tiên đăng cai, nói thêm. "Đó là Đức với nửa tá cầu thủ đẳng cấp thế giới. Và Anh, Italy… Số lượng và chất lượng của các cầu thủ là khủng khiếp. Và các trận đấu tuyệt vời. Bóng đá thuần túy. Phẩm chất. Bàn thắng. Và một ngôi sao vượt trên tất cả những người khác: Pele. Thật vinh dự cho tôi khi được đối đầu với ông ấy trong trận tứ kết và vinh dự hơn nữa là sau đó ông đã xướng tên tôi là người kế nhiệm. Những từ ngữ không bao giờ quên".', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (103, N'Từ Miami, nơi ông đang cư trú, Cubillas không quên được sức mạnh đội tuyển vàng - xanh. "Cận cảnh những người Brazil như thế nào? Như người ta tưởng tượng về chất lượng của họ. Bàn chân trái của Rivelino là duy nhất. Tốc độ của Jairzinho, khủng khiếp. Đối với người Peru, chiến đấu với họ là giải thưởng lớn nhất mà chúng tôi có thể có. Thật tệ là chúng tôi đã không gặp nhau sau đó một chút, trong trận bán kết. Brazil là một nhà vô địch xứng đáng. Họ đã chiến thắng với sức mạnh, với đẳng cấp. Chúng tôi đã bị bỏ lại. Dường như nếu cần ghi năm bàn, họ sẽ làm được", Cubillas nhớ về kỷ niệm cũ, với trận bán kết mà Peru thua 2-4.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (104, N'Pele. Số 10 xuất sắc. Ánh sáng của ông không ngừng tỏa sáng và mọi người xung quanh cũng tỏa sáng hơn thường lệ. Ông đến Mexico khi sắp bước sang tuổi 30 và tin rằng đây là cơ hội cuối cùng để "kết hôn" với chức vô địch thế giới lần thứ ba. Ông đã không làm ai thất vọng. Đối với các đồng nghiệp của mình, ông chỉ đơn giản là: O Rei (Vua). Đó là sự hiến dâng của huyền thoại. Pele đã ghi 4 bàn và góp mặt trong một nửa số bàn thắng của Brazil với các đường kiến tạo. Trong trận chung kết, vai trò của ông nổi bật hơn: bàn thắng mở tỷ số, rồi kiến tạo cho Jairzinho và Carlos Alberto.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (105, N'Vua bóng đá nổi bật vì tất cả những gì ông đã làm và cả những gì bị bỏ lại phía sau. Như cú sút từ vòng tròn giữa sân (phần sân nhà) đã hạ gục thủ môn Viktor của Tiệp Khắc, nhưng bay chệch cột dọc bằng một vài ngón tay. Tuyệt phẩm không thành bàn. Hay cú đánh đầu hiểm hóc mà thủ môn đội tuyển Anh đã cản phá trong trận đấu vòng bảng.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (106, N'"Tôi đã ghi bàn thắng, nhưng Banks cản phá nó", thiên tài người Brazil nhớ lại. Hay pha tận dụng sự dẻo dai của cơ thể để thực hiện cú qua người không bóng vượt qua thủ môn Ladislao Mazurkiewicz của Uruguay trong trận bán kết. Cú sút chéo góc của ông đi chệch cột dọc bên phải khung thành.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (107, N'Peru bị loại ở tứ kết, ở bán kết Brazil gặp Uruguay. Cuộc đọ sức của những nhà vô địch thế giới với ký ức về Maracanazo (trận chung kết trên sân Maracana mà Uruguay đánh bại chủ nhà Brazil) của 20 năm trước trong tiềm thức của tất cả người dân Brazil. Và, hơn thế nữa, khi Cubilla mở tỷ số cho "La Celeste" (màu xanh da trời) sau 19 phút. Victor Esparrago là một phần trên sân khấu đó. Sau đó, ông có một sự nghiệp lâu dài ở Tây Ban Nha với tư cách là cầu thủ cho Sevilla và Recreativo trong những năm 1970, cùng 25 năm huấn luyện cho nửa tá đội bóng La Liga.', 28)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (108, N'Esparrago ghi bàn thắng vào lưới Liên Xô trong hiệp phụ giúp đội của ông giành quyền vào bán kết. Từ quê hương Montevideo, sau nửa thế kỷ, ông đảm bảo rằng chỉ cần nhắm mắt lại, những trải nghiệm về trận bán kết với đội bóng của Pele sẽ tích tụ trong võng mạc của mình. "Đây là những ký ức không thể xóa nhòa. Uruguay đứng thứ tư và chúng tôi không đánh giá cao điều đó. Chúng tôi đã thua đội xuất sắc nhất mọi thời đại. Đội tốt nhất mà tôi từng thấy. Với cá nhân tuyệt vời của họ, nhưng làm việc như một tập thể".', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (109, N'Với tư cách là một huấn luyện viên, Esparrago có một lời giải thích chiến thuật về phong cách và lý do tại sao đội ngũ 5 tiền đạo có thể chơi cùng nhau. "Jairzinho thực sự là một cầu thủ chạy cánh phải và đó là nơi ông ấy đặt mình. Cần phải đặt số 10 trong số 11 và Rivelino, người thuận chân trái với dáng người thấp, ném mình sang trái. Gerson trì hoãn vị trí của mình, nhưng đóng vai trò quan trọng.', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (110, N'Về mặt bóng đá, ông là người thống trị đội bóng, dù Pele là ngôi sao và thủ lĩnh tinh thần. Gerson hét vào mặt mọi người. Từ bên dưới, bạn có thể nhìn và nghe rõ ràng. Tostao, người cũng có dáng người thấp, rất giỏi, thích nghi với vị trí trung gian trên hàng công. Tất cả họ đều chấp nhận vị trí của mình như những chuyên gia giỏi. Đó là chiến thắng của Brazil".', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (111, N'Esparrago không quên rằng thiết lập cho trận bán kết giữa Uruguay và Brazil đã được thay đổi vào phút cuối. "Điều đó chưa từng xảy ra trong lịch sử các kỳ World Cup. Đáng lẽ chúng tôi phải chơi ở Azteca, ở Mexico City. Chúng tôi đang trên đường từ Puebla thì người ta nói với chúng tôi trên xe buýt rằng trận đấu được diễn ra ở Guadalajara, nơi đối thủ đã tập trung. Không có gì để làm với độ cao hoặc nhiệt. Không ai giải thích lý do tại sao thay đổi được thực hiện, nhưng đó là để có lợi cho đối phương. Joao Havelange [Chủ tịch Ủy ban Thể thao Brazil, sau đó là chủ tịch FIFA] đã phụ trách rất nhiều".', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (112, N'Bốn năm sau, tại Germany 1974, Uruguay, cũng với Esparrago, đối mặt với Hà Lan vĩ đại. Tỷ số là 2-0 cho đội bóng của thủ lĩnh Johan Cruyff. Không ai tốt hơn khi so sánh hai đội đã đánh dấu một kỷ nguyên với phong cách chơi khác nhau của họ. "Hà Lan là một cỗ máy hoàn hảo, đồng bộ. Họ lẽ ra phải vô địch World Cup đó. Đó là một thứ bóng đá khác với Brazil. Ai sẽ thắng trong một trận đấu tưởng tượng giữa họ? Nó sẽ là hầu hết các hầu hết, nhưng trận đấu không bao giờ xảy ra. Brazil của năm 1970 vui vẻ và phô trương hơn, nhưng Hà Lan có thể đã làm tổn thương họ bằng lối chơi tốc độ và chiến thuật của họ. Họ dễ dàng bỏ lại 5 người trong hệ thống phòng ngự của chúng tôi trong cách đá tấn công".', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (113, N'Những lời khen ngợi của các đối thủ đối với Brazil hoàn toàn trùng khớp với phiên bản hoàn hảo như mô hình báo chí vẽ ra vào thời điểm này. Họ có sự chuẩn bị tuyệt vời. Không có điểm yếu nào . Hai tháng tập trung. Selecao rất chú trọng vào việc tăng cường thể lực, sự thiếu hụt lớn của đội trong sự kiện England 1966 trước đó. "Chúng tôi huấn luyện như một quân đội chính quy", thú nhận các cầu thủ không quen với kỷ luật quân đội tại thời bấy giờ.', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (114, N'Kết quả của công việc tập luyện khắt khe cho phép đội sở hữu nền tảng vững chắc, với 11 vị trí đá chính mà ai cũng có thể đảm nhận. HLV Zagallo đã sử dụng cùng một đội hình xuất phát trong trận đấu đầu tiên với Tiệp Khắc, trận bán kết và chung kết. Một khối phòng thủ bằng cách tấn công như vũ bão. Sự chiếm giữ các không gian của bộ ngũ tấn công cũng như hàng tiền vệ lên phía trước là không thể so sánh được.', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (115, N'Đối với nhiều nhà phê bình, dựa trên lý thuyết về đội hình, thực sự có bốn tiền đạo. Jairzinho luôn là một cầu thủ chạy cánh phải, mặc dù ở Botafogo vào thời điểm đó, anh chơi như một tiền đạo thứ hai. Bản vẽ chiến thuật của Brazil khiến giới chuyên môn bàn luận. Có lúc đó là 2-4-4, trong một thế trận tấn công. 4-3-3 được nhìn thấy trong nhiều thời điểm của trận đấu, và khi nói đến nghĩa vụ phòng ngự là đặt mình vào sơ đồ 4-4-2 cổ điển, với Jairzinho và Rivelino ở hai cánh. Pele và Tostao luôn đá cao nhất. Đó là một câu đố được hình thành để có bóng và tấn công. Một trong hai trung vệ, Piazza, thực sự là một tiền vệ. Carlos Alberto bắt đầu từ vạch phân cách. Clodoaldo, 21 tuổi, quét khu vực trung tâm của mình.', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (116, N'Cá nhân cộng với tập thể. Brazil thống trị tất cả các ngành nghệ thuật. Từ những tình huống quyết định, 1/3 số bàn thắng của đội, đến những hành động cá nhân và một trận đấu mang tính giao lưu, trong đó bóng là yếu tố cơ bản. Selecao thoải mái chơi bóng ngắn và dài. Họ kết hợp các vòng tuần hoàn dài với các lối thoát nhanh và trong hiệp đấu thứ hai, không thể ngăn cản các vũ công samba. Trong khoảng thời gian ấy, các học trò ông Zagallo đã củng cố các chiến thắng của mình trước Tiệp Khắc, Anh, Uruguay và Italy.', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (117, N'Luiz Pereira đã làm nên lịch sử tại Atletico Madrid. Ông đến vào năm 1975, chỉ một năm sau World Cup ở Đức, nơi ông góp mặt 6 trận. Bốn năm trước, tại Mexico 1970, Pereira thi đấu cho Palmeiras và ông biết rõ rằng đội tuyển Brazil đã giành được danh hiệu vào ngày sinh nhật của bản thân: 21/6. "Thật điên rồ. Tôi ra đường với tư cách là một người hâm mộ. Tôi đã không ra mắt đội tuyển quốc gia cho đến năm 1973. Tôi đã chơi 33 trận cho đến năm 1977 và đối với chúng tôi, đội tuyển năm 1970 đó là một tài liệu tham khảo lịch sử. ', 29)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (118, N'Không có kỳ World Cup nào trong số tám kỳ World Cup trước có nhiều điểm mới lạ như Aztec. Mặc dù World Cup 1954 ở Thụy Sĩ vinh dự là lần đầu tiên truyền hình xuất hiện, Mexico 1970 là sự kiện đầu tiên phát trực tiếp tất cả các trận đấu và có màu sắc thông qua vệ tinh.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (119, N'Thẻ vàng và thẻ đỏ cũng được áp dụng chính thức lần đầu tiên sau hành vi bạo lực của một số đội tại World Cup 1966 ở Anh và sự thiếu rõ ràng đối với những người hâm mộ, những người coi thường lời cảnh cáo của trọng tài đối với cầu thủ. Thật thú vị, không có trục xuất nào trong suốt giải đấu. Thẻ vàng World Cup đầu tiên được nhìn thấy trong trận khai mạc giữa chủ nhà Mexico và Liên Xô, thuộc về hậu vệ phải Kakhi Asatiani của đội khách.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (120, N'Ngoài ra, các đội đã có thể thực hiện hai sự thay đổi nhân sự trong số năm người được đăng ký trên băng ghế dự bị. Thay đổi đầu tiên xảy ra vào giờ nghỉ giải lao của trận khai mạc. Và đó là một cầu thủ Liên Xô khác: Anatoliy Puzach vào sân thay cho Viktor Serebryanikov.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (121, N'Sau 5 kỳ World Cup ở châu Âu (Italy, Pháp, Thụy Sĩ, Thụy Điển và Anh) và 3 kỳ diễn ra ở lục địa Nam Mỹ (Uruguay, Brazil và Chile), ngày hội bóng đá thế giới đã đến với Bắc Mỹ. Độ cao của hầu hết các địa điểm và sức nóng với ba khung thi đấu khác nhau là điểm nổi bật của giải. Trong số các đội tham gia, một đến từ châu Phi, một đại diện châu Á khác… và một đội đang có chiến tranh.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (122, N'Cho đến ngày đó chưa bao giờ có một đội châu Phi và một đội đến từ vòng loại khu vực châu Á - châu Đại Dương cùng tham dự. Maroc và Israel đã phá vỡ khuôn đúc. Hành trình giành quyền vào vòng chung kết của El Salvador diễn ra đầy kịch tính với Honduras, sau khi mỗi đội có một chiến thắng ở giai đoạn hai vòng loại.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (123, N'Trận đấu play-off được tổ chức trên sân trung lập (El Salvador thắng 3-0), và sau đó thứ được gọi là "Chiến tranh bóng đá" (La guerra del fútbol) bắt đầu. Rõ ràng là, những sự cố trên sân cỏ không phải là lý do của chiến tranh. Quân đội El Salvador xâm lược quốc gia láng giềng và mặc dù cuộc xung đột chính thức kéo dài bốn ngày (14-18/6/1969; vì thế, còn được gọi "cuộc chiến 100 giờ"), hiệp ước hòa bình mãi đến 10 năm sau mới được ký kết.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (124, N'Trong lĩnh vực này, một quả bóng thiết kế. Tạm biệt những quả cầu nâu 18 phân. Mexico 70 có nghĩa là một bước tiến chưa từng có trong mọi thứ liên quan đến trái bóng, được Adidas đặt tên Telster sau khi vệ tinh được phóng lên vũ trụ vào những năm 1960. Chất liệu da mới phủ polyurethane, chất liệu tổng hợp linh hoạt và thiết kế sáng tạo với 20 hình lục giác trắng và 12 ngũ giác đen để hiển thị tốt hơn trên truyền hình.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (125, N'Và một lưu ý khác cho lịch sử ở World Cup 1097. Lần đầu tiên và duy nhất cho đến nay, cả 4 đội tuyển vào bán kết (Brazil, Italy, Đức và Uruguay) đều là nhà vô địch thế giới.', 30)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (126, N'Tại vùng đất này, mặt trời lên từ 5 giờ sáng và ngay lập tức khiến cả thành phố trở thành cái lò nướng. Đến buổi trưa, nhiệt độ ngoài trời kết thúc màn phi mã của mình từ khó chịu tới khó khăn và cuối cùng đạt ngưỡng không có lợi cho sức khỏe.Ở Doha, những cơn gió vùng vịnh cũng không thể giải quyết vấn đề gì. Nó chỉ thổi thêm cái nóng vào trung tâm thành phố.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (127, N'Đây đã có thể là viễn cảnh tổ chức World Cup khi Qatar được xướng tên 12 năm trước. Chính những quan chức của FIFA đã đến đất nước tí hon thuộc vùng vịnh để “mục sở thị” và họ cho rằng việc các trận đấu diễn ra vào ban ngày sẽ mang đến những mối hiểm nguy cho cầu thủ.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (128, N'Quan chức của Qatar đã phải thuyết phục và hứa với FIFA tất cả những điều mà tổ chức quyền lực nhất thế giới bóng đá muốn: SVĐ mới, khách sạn mới, hệ thống làm mát mới và một cách tiếp cận rất mới tới bóng đá. Năm 2015, FIFA xác nhận giải đấu chính thức được tổ chức vào mùa đông thay vì dưới cái nóng hè.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (129, N'Trong những ngày vừa qua, Qatar đã tổ chức 3 trận play-off liên lục địa để quyết định hai suất cuối cùng góp mặt tại World Cup. Những đội bóng đáp chuyến tàu muộn tới ngày hội bóng đá lớn nhất thế giới cuối năm nay là Australia và Costa Rica.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (130, N'Đây cũng là cơ hội để nước chủ nhà World Cup 2022 đưa vào thử nghiệm những cơ sở hạ tầng tỷ USD. Liệu Qatar đã sẵn sàng để tổ chức một sự kiện mang tầm cỡ quốc tế chưa? Câu trả lời đối với từng người là rất khác nhau.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (131, N'5 tháng trước thời điểm trận mở màn World Cup 2022, Qatar đã hoàn thành những yêu cầu quan trọng nhất tới từ FIFA. 7 trong 8 sân vận động lắp đặt hệ thống điều hòa tân tiến đã được xây mới hoặc cải tạo. Cái còn lại sẽ được hoàn thành và đưa vào thử nghiệm trong vài tháng tới.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (132, N'Những sân bóng đều được kết nối với nhau bằng mạng lưới tàu nổi siêu tốc với những bến dừng chân nằm ở những vị trí huyết mạch tại Qatar. Rất nhiều hạng mục tân tiến đã được hoàn thành nhưng những phát kiến công nghệ mới của một thành phố thông minh vẫn chưa dừng lại.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (133, N'Trong loạt trận play-off vừa qua, Peru là quốc gia mang đến nhiều CĐV nhất với hơn 10.000 người. Nhưng thật khó để thấy bất cứ ai sải bước trên các con phố tại Qatar vào buổi sáng. Đất nước này chỉ thực sự trở nên sống động khi về đêm.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (134, N'Khi mặt trời lặn, Qatar biến thành một quốc gia du lịch năng động. Du khách có thể được bắt gặp ở các quán cafe, giữa lòng công viên rộng lớn hay tận hưởng những món ăn hạng sang tại các nhà hàng kín chỗ.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (135, N'Đối với người dân bản địa hay công nhân từ khu vực Nam Á, đây là một khung cảnh khác lạ đối với họ. Những chiếc điện thoại được lôi ra để lưu giữ lại hình ảnh của một Qatar nhộn nhịp, sống động và thân thiện với khách du lịch. Đây là một khung cảnh hiếm thấy nhưng sẽ trở nên quen thuộc khi tháng 11 tới.', 31)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (136, N'Những nhà tổ chức ước tính sẽ có tới hơn 1 triệu CĐV tới Qatar trong thời điểm World Cup. Sẽ có 32 khu vực fanzone cho 32 quốc gia tham dự cùng với đó là những khách sạn và địa điểm ăn uống được chuẩn bị sẵn sàng để đón tiếp những người hâm mộ hâm mộ bóng đá cuồng nhiệt nhất thế giới tụ họp tại Qatar.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (137, N'Đã có những câu hỏi được đặt ra: Số lượng du khách nhiều như vậy sẽ ăn, ngủ và đi mua sắm ở đâu? Những bến tàu và lều trại nào sẽ được dựng lên dịp World Cup?', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (138, N'Giới chức Qatar sẽ yêu cầu mọi CĐV đến đất nước này phải xuất trình vé đã mua hay giấy tờ liên quan tới phòng khách sạn đã đặt để giảm thiểu số người tới đây. Điều này chưa thể giải quyết hết được bài toán du khách tới đất nước này. Những CĐV bóng đá nhiệt thành tới từ quốc gia láng giềng như Saudi Arabia hay UAE sẽ khiến lượt người đến Qatar đông lên trông thấy.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (139, N'World Cup 2022 sẽ diễn ra ít hơn 4 ngày so với ngày hội bóng đá được tổ chức tại Nga hay Brazil. Điều này cũng sẽ giúp giải đấu được kiểm soát một cách dễ dàng hơn, bớt đi phần nào gánh nặng về việc kiểm soát người ra vào đất nước trong quãng thời gian diễn ra giải đấu.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (140, N'Thời gian là vẫn còn để Qatar có thể giải quyết nốt những công đoạn cuối cùng. Cơ sở vật chất đã hoàn thiện ở mức 90% và giờ sẽ là thời điểm họ có thể phô diễn sức mạnh và vẻ đẹp của đất nước vùng vịnh tân tiến tới du khách quốc tế.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (141, N'Đối với Qatar, vấn đề nhiệt độ giờ đây chẳng còn là mối bận tâm của họ nữa. Bất cứ ai đã có cơ hội được trải nghiệm mùa đông tại vùng vịnh sẽ kể rằng nhiệt độ ở nơi này thấp hơn rất nhiều so với ban ngày. Sức nóng của Qatar, của các fanzone và của World Cup cũng sẽ hạ nhiệt đi đôi chút, mang đến một cảm giác dễ chịu và êm ả.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (142, N'Hệ thống điều hòa trong các SVĐ đã được triển khai một cách chuẩn chỉ trong loạt trận play-off vừa qua. Trong cuộc đối đầu giữa Australia và Peru, nhiệt độ đo được trong sân Al Rayyan chỉ là 22 độ C giữa cái nóng 32 độ tại Qatar.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (143, N'Trong vài tháng tới, hệ thống điều hòa hiện đại nhất trong sân Lusail sẽ được hoàn thành. Đây là địa điểm diễn ra 10 trận tại World Cup 2022 trong đó có chung kết diễn ra vào ngày 18/12/2022. Mảnh ghép cuối cùng và lớn nhất đang chuẩn bị hoàn tất và Qatar đã sẵn sàng để đón chào những thực khách mê bóng đá đến vào cuối năm nay.', 32)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (144, N'Marca vừa tiết lộ điều khoản phá vỡ hợp đồng của Haaland tại Man City. Cụ thể, vào tháng 7/2024, mức phí để chân sút này rời Man City là 200 triệu euro. Đến tháng 7/2025, con số này chỉ còn 175 triệu euro. Đây là điều khoản quen thuộc trong các hợp đồng giữa Haaland với Dortmund lẫn Salzburg trước đây.', 33)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (145, N'Tại Dortmund, mức phá vỡ hợp đồng của chân sút Na Uy là 70 triệu euro. Con số này ở Salzburg là 20 triệu euro. Vừa qua, Haaland ký hợp đồng 5 năm với Man City, kéo dài đến tháng 6/2027. Điều khoản phá vỡ hợp đồng được 2 phía Haaland và Man City thống nhất.', 33)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (146, N'Hiện tại, Haaland là cầu thủ được định giá cao thứ 3 trên thế giới (152 triệu euro), theo Trung tâm Nghiên cứu Số liệu Cầu thủ (CIES) thống kê hồi tháng 2. Chân sút Na Uy thua Kylian Mbappe (219 triệu euro) và Vinicius Junior (185 triệu euro).', 33)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (147, N'Marca cho rằng khả năng Real Madrid chiêu mộ Haaland trong năm 2024 hoàn toàn khả thi. "Los Blancos" từng chấp nhận bỏ ra 200 triệu euro để mua lại một năm hợp đồng của Mbappe, nhưng bất thành. Tiền đạo người Pháp là mục tiêu chuyển nhượng ưu tiên của Real trong vài năm qua, còn Haaland là phương án dự phòng.', 33)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (148, N'Hiện tại, Real vẫn đặt trọn niềm tin vào Karim Benzema, ngôi sao sáng nhất của đội ở mùa giải 2021/22. "Los Blancos" tin rằng cựu sao Lyon sẽ duy trì được đẳng cấp trong vài năm tới. Bên cạnh đó, sự tiến bộ vượt bậc của bộ đôi tiền đạo Brazil, Vinicius Junior và Rodrygo khiến Real không vội vung tiền mua Haaland.', 33)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (149, N'Ronald de Boer đã nói về chủ đề có quá nhiều ảnh hưởng của người Hà Lan tại Manchester United. Cựu cầu thủ của Ajax đã tự mình trải nghiệm điều đó khi còn là cầu thủ của Barcelona và biết hậu quả sẽ là gì nếu đội bóng có màn trình diễn đáng thất vọng.', 34)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (150, N'Với Erik ten Hag là HLV trưởng, Mitchell van der Gaag là cánh tay phải và vụ chuyển nhượng sắp tới với Tyrell Malacia, United sẽ có 3 người Hà Lan đóng vai trò quan trọng trong đội. Quỷ đỏ cũng đang hy vọng sẽ có được Frenkie de Jong từ Barcelona.', 34)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (151, N'Năm 1999, De Boer là một trong nhiều cựu cầu thủ của Eredivisie tại Barcelona. Dù bóng đá Hà Lan có mối quan hệ mật thiết với Barca và cầu thủ của họ mang lại nhiều vinh quang cho đội bóng này, họ cũng bị chỉ trích khi CLB chủ sân Camp Nou không có được thành công.', 34)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (152, N'Cựu tuyển thủ Hà Lan có lời khuyên dành cho Ten Hag: "Nó có thể trở nên khó khăn vì rất nhiều chàng trai cùng quốc tịch gặp nhau trong phòng thay đồ. Nhờ đó, bạn thích nghi với đội nhanh hơn. Và nếu kết quả giảm sút, người Hà Lan ngay lập tức bị chỉ ra là những người có tội vì sự suy giảm đó."', 34)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (153, N'Trước Ten Hag, HLV Louis van Gaal cũng đã cùng làm việc với Robin van Persie, Memphis Depay và Daley Blind tại M.U. Công cuộc Hà Lan hóa đó cơ bản thất bại. Dù vậy kế hoạch của Ten Hag vẫn được kỳ vọng.', 34)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (154, N'The Athletic đưa tin Cristiano Ronaldo vẫn lấy lý do gia đình để không trở lại hội quân cùng Manchester United. Thậm chí, cầu thủ sinh năm 1985 được cho là không có ý định tham dự tour du đấu hè cùng đồng đội bắt đầu từ ngày 12/7 tại Thái Lan.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (155, N'"Ronaldo vẫn chưa hẹn ngày trở lại. Trong khi đó, MU sẽ lên đường đến Thái Lan vào ngày 8/7", tờ báo Anh cho biết.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (156, N'Không loại trừ khả năng tiền đạo 37 tuổi đang cố kéo dài thời gian để người đại diện Jorge Mendes tìm kiếm bến đỗ mới. Một số nguồn tin tại xứ sương mù tiết lộ, "siêu cò" Mendes đang liên hệ với Bayern Munich, Chelsea, Napoli.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (157, N'Trong khi đó, AS tiết lộ Mendes vừa ăn tối cùng Chủ tịch Barca, Joan Laporta. Tại đây, nhà môi giới người Bồ Đào Nha đưa ra ý tưởng đưa Ronaldo đến Camp Nou.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (158, N'Vụ chuyển nhượng khó tin nhưng vẫn có thể xảy ra, nhất là khi Barca đang bế tắc trong cuộc đàm phán với Bayern về trường hợp của Robert Lewandowski. Mức giá để sở hữu CR7 chắc chắn sẽ rẻ hơn số tiền 50 triệu euro nhà ĐKVĐ Bundesliga đưa ra dành cho Lewy.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (159, N'Ngày hôm qua (4/7), Ronaldo viện lý do gia đình để vắng mặt, nhưng vẫn bị phát hiện đến trung tâm huấn luyện của tuyển quốc gia Bồ Đào Nha Lisbon để tập luyện. Hành động của Ronaldo đang khiến một bộ phận người hâm mộ MU bất bình.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (160, N'Về phía Man United, CLB này vẫn vững lập trường giữ chân Ronaldo. HLV Erik ten Hag cũng hài lòng với tiền đạo sinh năm 1985 và sẽ bố trí cho anh một vị trí quan trọng trong kế hoạch ở mùa giải 2022/23.', 35)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (161, N'Giữa cơn bão tin đồn xoay quanh chuyển nhượng của Man United, CR7 nhẹ nhàng phát đi một thông điệp làm chấn động làng túc cầu. Cristiano Ronaldo, chỉ sau 1 năm trở về mái nhà xưa đã lên tiếng đòi ra đi. “Siêu cò” Jorge Mendes, người đại diện của Ronaldo, nhanh chóng đi chào hàng các CLB khác. Trong khi với Man United, dù liên tục khẳng định số 7 không phải để bán, ắt hẳn cũng đang chờ đợi một lời đề nghị thật sự hợp lý.', 36)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (162, N'Truyền thông lập tức đưa ra hàng loạt ứng viên tiềm năng cho Ronaldo trong mùa giải tới. Xét trên toàn bộ khía cạnh cả khách quan lẫn chủ quan, nước Đức là điểm đến hoàn hảo cho “Cầu thủ xuất sắc Man United” năm ngoái. Đây cũng là quốc gia cuối cùng để Ronaldo hoàn tất chuyến phiêu lưu tại những giải VĐQG hàng đầu thế giới, sau Anh, Italy và Tây Ban Nha.', 36)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (163, N'Nếu đặt chân đến Đức, Ronaldo nghiễm nhiên phù hợp nhất với Bayern Munich cả về tham vọng lẫn tầm vóc.', 36)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (164, N'Siêu sao người Bồ Đào Nha có tổng cộng 7 mùa giải tại Old Trafford, thực hiện 329 lần ra sân, đóng góp 142 bàn thắng và 71 pha kiến tạo. Anh thu về 3 Premier League, 1 Champions League, 1 FIFA Club World Cup, 2 Carabao Cup và hàng loạt danh hiệu lớn nhỏ khác. Từng đó là đủ để Cristiano Ronaldo bước vào ngôi đền huyền thoại của Man United. Họ giăng đầy biểu ngữ “Mừng về nhà” trong ngày anh xuất hiện lại trên thảm cỏ Old Trafford, ở tuổi 36. Và Ronaldo cũng yêu Man United không kém.', 37)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (165, N'Nhưng điều đó sẽ bị lung lay dữ dội nếu anh cập bến Chelsea, một trong các CLB đang dành sự quan tâm. Với những gì đã trải qua tại nửa đỏ Manchester, Ronaldo dường như không thể chơi cho một đội bóng nào khác tại Anh. Chính CR7 cũng không muốn phá vỡ mối liên kết với nơi đã làm nên tên tuổi.', 37)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (166, N'Người hâm mộ hẳn vẫn nhớ về Cristiano Ronaldo của tuổi đôi mươi, mái tóc xoăn nhuộm vàng, chiếc áo đỏ số 7 và "đảo chân như rang lạc". Đó chính là hình ảnh biểu tượng của CR7 tại nước Anh được in đậm trong dòng chảy lịch sử. Để giữ điều đó trọn vẹn, Ronaldo phải rời Ngoại hạng Anh nếu không chơi cho Man United.', 37)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (167, N'Ronaldo rời Man United vì không cảm thấy khả năng cạnh tranh của đội, nhưng Bayern Munich thì có. Đội bóng xứ Bavaria đủ tiềm lực để thống trị nước Đức trong nhiều năm nữa. Đó là điều kiện cần cho CR7 tiếp tục thu về những chiếc cúp để làm dày bộ sưu tập của mình.', 37)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (168, N'Đồng thời, Bundesliga cũng là môi trường phù hợp cho siêu sao người Bồ có thể tỏa sáng mỗi tuần. Chúng ta từng chứng kiến Ronaldo đã khó khăn như thế nào khi trở về nước Anh và hệ quả là chuỗi tịt ngòi dài nhất sự nghiệp. Tuổi tác rõ ràng không chỉ là những con số. Nếu muốn đào sâu thành tích cá nhân, Ronaldo cần một sân chơi “dễ thở” hơn. Danh hiệu “Vua phá lưới” Bundesliga cũng là một mục tiêu không tồi cho anh.', 37)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (169, N'Trùng hợp thay, Bayern Munich cũng đang tìm kiếm sự thay thế cho Robert Lewandowski. Đội chủ sân Allianz Arena cần một người nhả đạn đều đặn và có thể đem về ít nhất 20 bàn/mùa. Haaland đến Man City, Nunez đến Liverpool, Lukaku về Inter. Khi Bayern Munich đang loay hoay thì Ronaldo như chiếc phao cứu sinh đột nhiên xuất hiện. Không ngạc nhiên nếu đội bóng xứ Bavaria tạo điều kiện cho chân sút người Ba Lan ra đi trong thời gian tới.', 38)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (170, N'Cristiano Ronaldo đủ bản lĩnh cũng như kinh nghiệm để hòa nhập với dàn sao của Bayern Munich. Ở mùa trước, anh thậm chí còn làm tốt ở vai trò lui xuống nhận bóng thay vì “mắc võng” trong vòng cấm. Cộng với những chân tiếp đạn chất lượng tại Bayern, Ronaldo hoàn toàn có thể tạo nên một mùa giải bùng nổ như những năm tháng tại Real Madrid.', 38)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (171, N'Bayern Munich không phải chi ra quá nhiều tiền để sở hữu Ronaldo khi anh chỉ còn một năm trong hợp đồng. BLĐ đội bóng cũng thừa hiểu doanh thu bán áo đấu hay các giá trị thương mại mà CR7 mang lại là cực kỳ lớn. Nói không ngoa, Bundesliga có cơ hội đón về tân binh vĩ đại nhất lịch sử giải đấu.', 38)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (172, N'Đây hiển nhiên là khát khao lớn nhất của Cristiano Ronaldo tại cấp CLB trong giai đoạn cuối sự nghiệp. Không nơi nào cho anh cơ hội đăng quang tốt hơn Bayern Munich. PSG quá thiếu bản lĩnh, Chelsea có vẻ chưa đủ sức, nhưng Bayern Munich hội tụ tất cả. Họ cần một đầu tàu để vực dậy trong các thời điểm khó khăn tại sân chơi châu lục. Người từng 5 lần vô địch và ghi nhiều bàn thắng nhất giải – Ronaldo – quá phù hợp để đảm nhiệm vai trò đó.', 38)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (173, N'Ronaldo khao khát trở thành người giỏi nhất ở sân chơi của những kẻ mạnh nhất. Chỉ Champions League mới có thể làm CR7 mãn nguyện trước khi chịu thua thời gian và rời sân cỏ. Xa xôi hơn, gia nhập Bayern Munich cũng có khả năng giúp Ronaldo cạnh tranh cho Quả bóng vàng, giải thưởng mà anh còn kém đại kình địch Messi.', 38)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (174, N'Đó là những viễn cảnh trong mơ cho một cuộc tình được chờ đợi. Các fan của CR7 hẳn cũng đã chuẩn bị tinh thần để hô vang khẩu hiệu: “Mia san Mia, Bayern.”', 38)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (175, N'1. Ronaldo vắng mặt', 39)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (176, N'Trong khi các đồng đội đã tập luyện trở lại thì ngôi sao Cristiano Ronaldo vẫn vắng mặt vì "lý do gia đình". Chân sút người Bồ Đào Nha đã xin phép BHL và được chấp nhận. 

Tuy nhiên, cũng trong thời gian này, có rất nhiều tin đồn về việc Ronaldo rời Man Utd. Tờ The Times cho biết CR7 đang muốn kiếm một bến đỗ mới để được chơi ở Champions League. Chelsea và Bayern Munich là những CLB được cho đã tiếp cận Ronaldo trong một tháng qua. Cần nhớ, từ khi chuyển đến Anh thi đấu vào năm 2003, Ronaldo chưa bao giờ phải chơi ở Europa League.', 39)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (177, N'2. Các ngôi sao trở lại', 39)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (178, N'Nếu trong buổi tập vào tuần trước, nhiều ngôi sao của Quỷ đỏ vẫn đang được "nghỉ phép" thì giờ họ có mặt gần như đông đủ. Harry Maguire, Victor Lindelof, Scott McTominay, Fred cùng nhiều người khác đã xuất hiện tại Carrington sau quãng thời gian phục vụ đội tuyển quốc gia. Đây là thời điểm mà các ngôi sao này phải chứng minh được thực lực dưới thời HLV mới.', 39)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (179, N'3. Van De Beek chăm chỉ tập luyện', 39)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (180, N'Donny van de Beek đã dành nửa cuối mùa giải vừa qua ở Everton theo dạng cho mượn. Tuy nhiên, những gì mà anh thể hiện tại Goodison Park không khác quá nhiều so với khi chơi cho Man Utd.

Dưới sự dẫn dắt của người thầy cũ, người ta hy vọng cầu thủ người Hà Lan sẽ chơi bóng đúng với mức giá 45 triệu bảng. 

Lúc này, vẫn còn quá sớm để dự đoán về phong độ của anh ở mùa giải tới. Tuy nhiên, người ta đã thấy được một Van De Beek rất nỗ lực trên sân tập.', 39)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (181, N'4. Wan-Bissaka sẵn sàng chiến đấu cho vị trí xuất phát', 40)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (182, N'Hậu vệ Aaron Wan-Bissaka bước vào giai đoạn tiền mùa giải với quyết tâm khá lớn. Các phóng viên ghi nhận, cầu thủ này rất chịu khó tập luyện các bài tập về chiến thuật cũng như kỹ thuật để ghi điểm với Erik Ten Hag. 

Cũng phải nói thêm, trong cách chơi của Ten Hag, ông luôn muốn các hậu vệ cánh có khả năng tham gia tấn công tốt. Thế nên, đây sẽ là một thử thách không nhỏ cho Wan-Bissaka.', 40)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (183, N'5. Ten Hag thể hiện kỹ năng', 40)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (184, N'Ten Hag cho thấy mình là mẫu HLV khá hòa đồng với các cầu thủ. Sự hoạt bát và tính tích cực là những thứ mà người ta đã thấy ở thuyền trưởng này. Người ta còn ghi nhận Ten Hag thể hiện kỹ năng chơi bóng của mình trước các học trò. Khác với Ralf Rangnick, Ten Hag tác động nhiều hơn vào các buổi tập của Man Utd. Đây có thể là một điểm thu hút các cầu thủ.', 40)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (185, N'Theo El Chiringuito TV, Messi đã gọi điện cho Xavi để hỏi về khả năng trở lại Barca ngay trong mùa hè 2022. Thuyền trưởng của Barca được cho là "vui" với lời đề nghị của người đồng đội cũ, nhưng nhấn mạnh mình cần gọi điện cho Chủ tịch Joan Laporta trước. Laporta vẫn chưa gọi điện cho Messi.', 41)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (186, N'Siêu sao người Argentina được mô tả không hạnh phúc ở Paris. Nhân vật quan trọng nhất ở đội bóng thủ đô nước Pháp giờ là Kylian Mbappe sau siêu hợp đồng mới ký hồi cuối tháng 5. Mbappe giờ có quyền can thiệp vào những quyết định hệ trọng nhất của đội bóng, bao gồm cả việc chọn lựa HLV và lối chơi. Điều này được cho là khiến Messi không hài lòng.', 41)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (187, N'PSG đang tiến hành thay máu lực lượng trong mùa hè 2022. Neymar được cho là đã được thông báo phải chuyển đi. Mauro Icardi khả năng cũng sẽ rời sân Parc des Princes để trở về Italy khoác áo Monza. Ở chiều ngược lại, PSG đã mang về tiền vệ Vitinha từ Porto với giá 40 triệu bảng.', 41)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (188, N'Tân Giám đốc thể thao Luis Campos đang cố gắng chốt mua trung vệ Milan Skriniar từ Inter với giá 70 triệu euro. Theo Le Parisien, PSG cũng đã đạt thỏa thuận chiêu mộ tiền đạo Gianluca Scamacca từ Sassuolo với giá 50 triệu euro.

Messi tới PSG theo dạng chuyển nhượng tự do từ Barca vào mùa hè 2021. Siêu sao người Argentina trải qua mùa giải thi đấu kém ấn tượng bậc nhất sự nghiệp khi chỉ ghi 11 bàn trên mọi đấu trường cho đội bóng Pháp.

Cách đây hai tuần, Chủ tịch PSG Nasser Al-Khelaifi quả quyết mùa giải tới sẽ là thời điểm Messi "chơi thứ bóng đá hay nhất sự nghiệp". Hợp đồng của Messi với PSG có thời hạn tới hết tháng 6/2023.', 41)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (189, N'Trải qua một mùa giải thành công, Real Madrid đang gấp rút tiến hành giữ chân các trụ cột. Họ đang gặp thuận lợi trong việc thuyết phục Vinicius Junior ký hợp đồng mới. Một khi Vinicius trở lại Real trước thềm mùa giải mới sau kỳ nghỉ hè, anh sẽ đặt bút ký vào thỏa thuận tiếp theo.

Ngôi sao người Brazil chỉ thuộc một trong số những cầu thủ Los Blancos phải trói chân. Sau chân chạy cánh sinh năm 2000, đội chủ sân Bernabeu muốn gia hạn hợp đồng mới với trụ cột khác là Eder Militao.', 42)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (190, N'Khi Sergio Ramos và Raphael Varane ra đi, Militao trở thành trung vệ khó bị thay thế ở hàng thủ Real. Mùa giải vừa rồi, ngôi sao người Brazil cùng David Alaba tạo ra tấm lá chắn thép vững chắc che chắn khung thành của Thibaut Courtois.', 42)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (191, N'Màn trình diễn xuất sắc vượt bậc giúp Militao chiếm niềm tin của HLV Carlo Ancelotti. Cựu cầu thủ Porto thi đấu 50 trận trên mọi đấu trường vào mùa giải vừa rồi. Chính vì vậy, Real đã có thỏa thuận cam kết tương lai dài hạn với Militao dù anh còn giao kèo đến hè 2025. Được biết, trung vệ 24 tuổi sẽ gia hạn hợp đồng với CLB chủ quản đến mùa hè 2028. Thông báo chính thức về việc này sẽ sớm được Real công bố.

Đội bóng Hoàng gia đang từng bước xây dựng nền móng cho tương lai. Không chỉ gia hạn với các trụ cột mà họ còn chiêu mộ nhiều tân binh trẻ triển vọng khác như Aurelien Tchouameni.', 42)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (192, N'"Giỏi hơn Kylian Mbappe", đó là những gì chủ tịch Barcelona, Joan Laporta nhận xét về Dembele. Với HLV Xavi, huyền thoại người Tây Ban Nha đánh giá Dembele là "ngôi sao số một ở vị trí của mình". Chuyện gì đã xảy ra khiến Dembele không thể đáp ứng kỳ vọng tại Barca?', 43)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (193, N'Mùa hè 2017, Dembele gia nhập Barca với mức phí chuyển nhượng 140 triệu euro, theo Transfermarkt. Cho đến hiện tại, kỷ lục của Dembele tại Camp Nou chưa được phá. Cầu thủ người Pháp đạt thoả thuận đến Barca ít ngày sau khi Neymar gia nhập PSG với một hợp đồng kỷ lục khác. Thời điểm đó, giới chuyên môn nhận định Barca đánh cược vào canh bạc lớn.

Trước khi sang Tây Ban Nha, Dembele chỉ thi đấu tại Ligue 1 và Bundesliga, những giải đấu "an toàn" hơn La Liga. Sau 5 năm, dễ thấy Dembele trở thành nỗi thất vọng của Barca. Chân sút người Pháp ghi 32 bàn sau 105 lần ra sân. Phần lớn thời gian chơi bóng ở Camp Nou, Dembele phải ngồi ngoài vì chấn thương.', 43)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (194, N'Theo ESPN, tiền vệ người Pháp mất hơn 700 ngày để điều trị chấn thương tại Barca, tức gần 2 năm thi đấu. Thống kê khác cho thấy Dembele gặp 9 chấn thương ở các vị trí khác nhau trên cơ thể, tất cả đều trong màu áo Barca. Dembele có tiềm năng lớn, nhưng không phải mẫu cầu thủ có thể ra sân và tỏa sáng đều đặn hàng tuần. Đây là yếu tố tạo nên sự khác biệt của cầu thủ giỏi và một ngôi sao.

Bild của Đức tin rằng chấn thương liên miên của Dembele xuất phát từ việc cầu thủ này không có thói quen ăn uống khoa học. Dembele thích đồ ăn nhanh. ESPN tiết lộ Barca phải tìm kiếm đầu bếp riêng cho Dembele, tạo ra thực đơn phù hợp, đồng thời đưa ra thêm các bài tập ở phòng gym.

Dembele còn bị chỉ trích vì lối sống vô kỷ luật. Tiền vệ người Pháp hay thức khuya chơi game và đi tập muộn, hoặc vắng mặt không xin phép. Có lần, Dembele chấn thương nhưng không thông báo với Barca. Anh không về tập trung cùng toàn đội, thay vào đó lên máy bay về Rennes, Pháp để thăm mẹ. Sự vô kỷ luật của Dembele khiến HLV Ernesto Valverde tức giận. Sau đó, tiền vệ này phải nghỉ thi đấu trong 5 tuần.', 43)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (195, N'Tất cả những vấn đề trên, cộng hưởng với áp lực khi là bản hợp đồng đắt giá hàng đầu La Liga, đã đánh gục Dembele. "Cậu ấy có tố chất tốt, từ tốc độ đến khả năng ghi bàn. Nhưng vấn đề của Dembele dễ bị tác động từ các yếu tố bên ngoài", huyền thoại Hristo Stoichkov của Barca lên tiếng.

Năm 2020, trong cuộc khảo sát của cộng đồng FC Barcelona Noticias về vai trò của Dembele, 67% CĐV chọn phương án bán cầu thủ người Pháp ngay lập tức. Trong khi chỉ 20% CĐV kỳ vọng Dembele vẫn còn giá trị.

Tháng 4/2020, Rivaldo nói thẳng Barca nên bán Dembele: "Cậu ấy ký hợp đồng gần 3 năm trước, đã có đủ thời gian để chứng minh bản thân. Tôi nghĩ đội cần bán hoặc đổi Dembele lấy một cầu thủ khác".', 43)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (196, N'Vẫn có những mặt tốt của Dembele ở Barca. Anh giao tiếp thành thạo tiếng Tây Ban Nha, có mối quan hệ tốt đẹp với đồng đội và ban huấn luyện. Khi trở lại Barca làm việc, Xavi xem Dembele là quân bài chủ chốt. “Hôm nay, Ousmane đã cho thấy cậu ấy có thể là cầu thủ hay nhất thế giới ở vị trí của mình", Xavi nói sau trận thắng 4-0 trước Athletic Bilbao.

Những lời khen của Xavi cho thấy nỗ lực của Dembele, nhưng vẫn chưa thể làm lu mờ định kiến về cầu thủ người Pháp. Với cái giá hơn 100 triệu euro, CĐV Barca có quyền đòi hỏi một cầu thủ để lại tầm ảnh hưởng to lớn.', 43)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (198, N'Trong tiết lộ gần nhất của báo giới Tây Ban Nha, HLV Xavi và ban lãnh đạo Barca không tìm được tiếng nói chung trong việc ký hợp đồng mới với Dembele. Cầu thủ người Pháp trở thành cầu thủ tự do vào hè này. Sự bế tắc trong đàm phán giữa đôi bên xuất hiện từ đầu năm 2022, đến nay vẫn chưa có hồi kết.

ESPN tin rằng không chỉ Xavi, chủ tịch Laporta cũng thất vọng khi chưa thể thuyết phục Dembele ở lại. "Đối với tôi, Dembele giỏi hơn Mbappe", chủ tịch Barca từng tạo tranh cãi với phát ngôn này.

Laporta có quan điểm riêng của mình. Ở Barca, không cầu thủ chạy cánh nào sở hữu phẩm chất đặc biệt như Dembele. Anh nhanh nhẹn, kỹ thuật và đá được cả hai chân. Ở thời đỉnh cao, Dembele khiến CĐV phát cuồng vì những bước chạy tốc độ của mình.', 45)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (199, N'Hiện tại, Dembele là cái gai trong mắt fan Barca. Anh bị chính CĐV nhà la ó khi vào sân ở trận gặp Dortmund tại Europa League vào đầu tháng 2. Trước đó ít ngày khi Barca đụng độ Atletico Madrid, Dembele không thi đấu, nhưng vẫn bị fan chỉ trích vì có mặt trong danh sách dự bị.

Hồi đầu năm, Barca dọa đẩy Dembele lên khán đài nếu không ký hợp đồng mới. Điều này khiến cầu thủ người Pháp và người đại diện tức giận. "Lời đe dọa đó không có tác dụng với chúng tôi", Moussa Sissoko, đại diện của Dembele, nói trên RMC Sport vào tháng 1. "Chúng tôi thể hiện rõ sự lựa chọn của Dembele không dính dáng gì đến tiền bạc. Nếu không, cậu ấy đã rời CLB từ lâu".

Chuyện Dembele rời CLB theo dạng chuyển nhượng tự do là kịch bản có khả năng xảy ra cao nhất. Nếu vậy, Barca sẽ mất trắng hơn 100 triệu euro sau 5 năm đầu tư. Điều này còn tệ hơn vụ bán Coutinho cho Aston Villa với mức phí 20 triệu euro. Trên Transfermarkt, Dembele chỉ còn có giá 30 triệu euro.', 45)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (200, N'Chelsea được đồn đoán là bến đỗ lý tưởng nếu Dembele rời Barca. Tại đây, HLV Thomas Tuchel sẽ tái ngộ học trò cũ từng làm việc chung tại Dortmund. Trong quá khứ, Dembele cũng nhiều lần xuất hiện trong danh sách chuyển nhượng của các CLB Ngoại hạng Anh.

Dembele hồi sinh ngoạn mục trong nửa cuối mùa giải qua. Đó là sự khẳng định rằng khi tiền vệ người Pháp lành lặn, anh đủ sức chơi bóng ở đẳng cấp cao.', 45)
GO
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (201, N'Robert Lewandowski sở hữu thể chất ấn tượng ở tuổi 33. Nhờ đó, tiền đạo Ba Lan ra sân và ghi bàn một cách bền bỉ trong suốt những năm qua. Anna Stachurska, vợ của Lewandowski, là một HLV cá nhân và cựu võ sĩ karate chuyên nghiệp. Chính cô nàng giúp chồng cải thiện vóc dáng đáng kể. Mỗi khi nhàn rỗi, Lewandowski tự "nhốt" bản thân trong phòng gym nhiều giờ. Anh còn tập yoga và nạp vào cơ thể thực đơn được thiết kế bởi cô vợ Anna.', 46)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (202, N'Tiền vệ Leon Goretzka có màn lột xác từ một cầu thủ gầy gò, mảnh khảnh, trở thành một trong những cầu thủ có hình thể đẹp nhất ở Bayern. Cao 1,89 m, Goretzka trở thành điểm tựa đáng tin cậy ở tuyến giữa Bayern.', 47)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (203, N'Năm 2020, tấm hình Goretzka ăn mừng chức vô địch Champions League khiến dư luận chú ý. Truyền thông Anh mô tả tuyển thủ Đức có bắp tay to gấp đôi bình thường, múi bụng cũng nổi lên rõ ràng. Goretzka đã phải tập luyện kết hợp ăn uống hợp lý để có được vóc dáng đẹp.', 48)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (204, N'Chỉ một năm sau khi gia nhập Bayern, sao trẻ Alphonso Davies thay đổi hoàn toàn so với quãng thời gian chơi bóng ở Mỹ. Hậu vệ trái có thân hình đáng mơ ước với bất kỳ cầu thủ', 49)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (205, N'Tận dụng quãng thời gian chấn thương hồi tháng 7/2021, Davies vùi mình vào các bài tập trong phòng gym. Cầu thủ Bayern khiến nhiều đối thủ phải e ngại khi đối đầu bên hành lang trái vì quá nhanh nhẹn và mạnh mẽ.', 50)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (206, N'Sadio Mane là tân binh của Bayern mùa hè này. Tiền đạo Senegal để lộ cơ bắp săn chắc trong buổi tập luyện ở Mallorca, Tây Ban Nha để chuẩn bị cho mùa giải mới.', 51)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (207, N'Mane nằm trong số những cầu thủ có thể chất đáng nể ở Ngoại hạng Anh. Không chỉ nhanh nhẹn, khéo léo, Mane còn có sức bền ấn tượng. Nhờ làm việc với đội ngũ HLV và bác sĩ chuyên nghiệp hàng đầu thế giới tại Liverpool, Mane phát triển cơ bắp nhanh chóng và hiệu quả.', 52)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (208, N'Sau khi khép lại chiến dịch 2021/22, Sadio Mane công khai ý định chia tay Liverpool. Tuyển thủ Senegal đã gặt hái mọi vinh quang cùng The Kop, do đó anh muốn tìm kiếm thử thách mới. Rất nhanh chóng, Mane đã chuyển sang khoác áo Bayern Munich với giá 35 triệu bảng.', 53)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (209, N'Tại Allianz Arena, chân sút 30 tuổi sẽ ký vào bản hợp đồng có thời hạn đến tháng 6/2025, hưởng mức thu nhập lên đến 250.000 bảng/tuần. Theo Mirror, Mane cũng vượt mặt người đồng đội cũ Mohamed Salah để trở thành cầu thủ châu Phi hưởng lương cao nhất thế giới.', 53)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (210, N'Salah hiện hiện có mức thu nhập 220.000 bảng/tuần tại Liverpool. Ngôi sao người Ai Cập muốn tăng con số này lên 400.000 bảng/tuần trong cuộc đàm phán hợp đồng mới với The Kop. Tuy nhiên hai bên vẫn chưa tìm được tiếng nói chung. The Kop không muốn đáp ứng yêu cầu từ Salah, bởi tiềm ẩn rủi ro cấu trúc lương của CLB bị phá vỡ.', 53)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (211, N'Thomas Partey và Riyah Mahrez xếp sau Salah trong danh sách, khi họ cùng hưởng mức thu nhập 200.000 bảng/tuần. Trong danh sách 9 cầu thủ châu Phi có đãi ngộ cao nhất, Premier League chiếm 7 đại diện.', 53)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (212, N'Giám đốc thể thao của Bayern, Hasan Salihamidzic muốn thuyết phục Robert Lewandowski ở lại Munich sau mùa hè. Mới đây nhất, ông đã gặp gỡ tiền đạo này và người đại diện Pini Zahavi tại Mallorca.

Dù còn hợp đồng đến năm 2023 nhưng Lewandowski vẫn muốn rời Bayern ngay lập tức để chuyển sang khoác áo Barcelona. Tuy nhiên, Bayern chưa hề dao động trước đề nghị của đối phương.', 54)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (213, N'Phóng viên Florian Plettenberg của Sky tường thuật: "Chúng tôi nghe rằng đó là một cuộc trò chuyện thật sự, rất có giá trị. Nhưng cuối cùng, những nỗ lực của Salihamidzic dường như không thay đổi được mong muốn của Lewandowski. Mọi chuyện vẫn không đổi: Lewandowski muốn rời Bayern để chuyển sang FC Barcelona."', 54)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (214, N'Lời đề nghị ban đầu của Barca được cho là khoảng 32 triệu euro vào khoảng 1 tháng trước. Theo Plettenberg, đội bóng xứ Catalan muốn tăng lời đề nghị với Munich: "Họ muốn gây sức ép lên Bayern. Nhưng Bayern tính giữ anh ấy lại và không để anh ấy ra đi."', 54)
INSERT [dbo].[Content] ([ContentId], [Content], [ImageId]) VALUES (215, N'Thực tế, Bayern có vẻ đã chấp nhận sự ra đi của tiền đạo người Ba Lan khi chiêu mộ Sadio Mane từ Liverpool. Bản hợp đồng này vừa chính thức được công bố. Mane chia tay The Reds sau nhiều năm thi đấu cực kỳ thành công ở đây, bao gồm việc giành Premier League và Champions League.', 54)
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (1, N'291702568_586649482796409_3924139562892913149_n-1656780392.jpg', 1)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (2, N'viet-nam-nhan-ton-that-lon-truoc-ngay-dau-thai-lan-o-giai-aff-154711.jpg', 2)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (3, N'thay-dong-doi-pham-loi-ho-tan-tai-giat-the-do-cua-trong-tai-dem-giau-47e896fa-1003.jpg', 3)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (4, N'zvvzvzvzvz-1656765772.jpg', 4)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (5, N'u19-viet-nam-1551749787-width2048height1366-1656766000.jpg', 4)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (6, N'291347230_1896531087209500_2639041268414725972_n-1656782731.jpg', 5)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (7, N'289674295_1896531173876158_4793789489941460821_n-1656782789.jpg', 5)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (8, N'tin-chuyen-nhuong-toi-3-7-154731.jpg', 6)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (9, N'tin-chuyen-nhuong-toi-3-7-154732.jpg', 6)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (10, N'juventus-hut-mau-kinh-dich-mo-duong-cho-chelsea-don-sieu-trung-ve-154725.jpg', 6)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (11, N'tin-chuyen-nhuong-toi-3-7-154736.jpg', 6)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (12, N'tin-chuyen-nhuong-toi-3-7-154739.jpg', 6)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (13, N'juventus-hut-mau-kinh-dich-mo-duong-cho-chelsea-don-sieu-trung-ve-154724.jpg', 7)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (14, N'juventus-hut-mau-kinh-dich-mo-duong-cho-chelsea-don-sieu-trung-ve-154726.jpg', 7)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (15, N'juventus-hut-mau-kinh-dich-mo-duong-cho-chelsea-don-sieu-trung-ve-154728.jpg', 7)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (16, N'arsenal-nguy-co-mat-muc-tieu-so-mot-o-hang-tien-ve-154705.jpg', 8)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (17, N'ronaldo-tuyen-bo-muon-roi-mu-hang-loat-ong-lon-xep-hang-san-don-154655.jpg', 9)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (18, N'tin-chuyen-nhuong-3-7-154664.jpg', 9)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (19, N'tin-chuyen-nhuong-3-7-154665.jpg', 9)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (20, N'tin-chuyen-nhuong-3-7-154667.jpg', 9)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (21, N'tin-chuyen-nhuong-3-7-154666.jpg', 9)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (22, N'fwpwtohxkaaspr1-1656759323.jpg', 10)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (23, N'39560166-0-image-a-204_1613864334142-1656760056.jpg', 10)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (24, N'son-01-1915.jpg', 11)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (25, N'messi-01-1817.jpg', 12)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (26, N'messi-02-1817.jpg', 12)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (27, N'fifa-ap-dung-thay-doi-tai-world-cup-2022-143359.png', 13)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (28, N'pele-01-1942.jpg', 14)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (29, N'pele-02-1942.jpg', 14)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (30, N'pele-03-1942.jpg', 14)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (31, N'screenshot-2022-06-19-123007-1233.jpg', 15)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (32, N'screenshot-2022-06-19-123305-1233.jpg', 15)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (33, N'haaland-01-1954.jpg', 16)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (34, N'bdf66228-71c4-45c0-8830-64d5ceebcbc2-2307.jpg', 17)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (35, N'ronaldo-tiep-tuc-lam-kho-man-united-155054.png', 18)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (36, N'ro-ba-01-1917.jpg', 19)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (37, N'ro-ba-02-1917.jpg', 19)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (38, N'ro-ba-03-1917.jpg', 19)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (39, N'1-2138.jpg', 20)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (40, N'3-2137.jpg', 20)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (41, N'messi-01-1857.jpg', 21)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (42, N'4-1055.jpg', 22)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (43, N'dembele-01-1844.jpg', 23)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (45, N'dembele-02-1844.jpg', 23)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (46, N'bayern-01-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (47, N'bayern-03-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (48, N'bayern-04-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (49, N'bayern-05-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (50, N'bayern-06-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (51, N'bayern-07-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (52, N'bayern-08-1947.jpg', 24)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (53, N'1-1057.jpg', 25)
INSERT [dbo].[Image] ([ImageId], [ImageUrl], [NewsId]) VALUES (54, N'lewandowski-01-1911.jpg', 26)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (1, 2, N'HLV Kiatisak hài lòng dù HAGL không thắng nổi 10 người của Bình Định', N'HLV Kiatisak Senamuang hài lòng với 1 điểm mà HAGL có được dù thi đấu hơn người trước CLB Bình Định ở trận cầu tâm điểm vòng 5 V-League 2022.', N'kiatisak-hagl-1651155261.jpeg', 2, CAST(N'2022-07-03T19:21:15.750' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (2, 2, N'Việt Nam nhận tổn thất lớn trước ngày đấu Thái Lan ở giải AFF', N'Tình hình lực lượng của U19 Việt Nam tiếp tục có biến động sau trận đấu gặp U19 Indonesia.', N'viet-nam-nhan-ton-that-lon-truoc-ngay-dau-thai-lan-o-giai-aff-154710.jpg', 2, CAST(N'2022-07-03T19:21:15.790' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (3, 2, N'Đồng đội phạm lỗi, Hồ Tấn Tài "tịch thu" thẻ đỏ của trọng tài và cái kết đắng', N'Trong trận đấu giữa CLB Bình Định và HAGL ở V.League 2022 vào tối ngày 2/7, hậu vệ Hồ Tấn Tài đã có hành vi giật và giấu thẻ đỏ của trọng tài.', N'giau-1656818927.jpeg', 2, CAST(N'2022-07-03T19:23:27.387' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (4, 2, N'U19 Việt Nam bằng thành tích vô địch của Nhật Bản, Iran qua các mùa U19 ĐNÁ', N'Đánh giá về thành tích qua các mùa giải U19 Đông Nam Á, U19 Việt Nam đang xếp thứ 5 với chỉ 1 lần lên ngôi vô địch vào năm 2007.', N'cp_gxuz-1656766072.jpg', 2, CAST(N'2022-07-03T19:24:13.873' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (5, 2, N'CLB Viettel đón 2 sự bổ sung quan trọng sau vòng bảng AFC Cup', N'CLB Viettel vừa chào đón sự trở lại rất cần thiết về nhân sự để chuẩn bị cho V-League 2022, sau khi vượt qua vòng bảng AFC Cup.', N'truc-tiep-viettel-1-0-phnom-penh-crown-thi-dau-tu-tin-152979.webp', 2, CAST(N'2022-07-03T19:25:04.360' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (6, 2, N'Tin chuyển nhượng tối 3/7: Thành Manchester đấu đá vì người thay Ronaldo, Chelsea áp sát siêu trung vệ?', N'Thành Manchester đại chiến vì người thay Ronaldo hay Chelsea ngày càng gần ''siêu trung vệ'' là những tin tức chuyển nhượng đáng chú ý tối nay 3/7.', N'tin-chuyen-nhuong-toi-3-7-154741.webp', 8, CAST(N'2022-07-03T19:25:39.450' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (7, 2, N'Juventus chốt xong người thay thế, mở đường cho Chelsea đón ''siêu trung vệ''', N'Động thái mới nhất của Juventus đã đem tin vui đến cho Chelsea cơ hội cực lớn để chiêu mộ thành công trung vệ mơ ước bấy lâu nay là Matthijs De Ligt.', N'de-ligt-chelsea-1656838247.jpg', 8, CAST(N'2022-07-03T19:35:20.430' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (8, 2, N'Arsenal nguy cơ mất mục tiêu số một ở hàng tiền vệ', N'Arsenal hiện đứng trước nguy cơ có thể bị vượt mặt ở một thương vụ.', N'arsenal-nguy-co-mat-muc-tieu-so-mot-o-hang-tien-ve-154706.jpg', 8, CAST(N'2022-07-03T19:36:06.203' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (9, 2, N'Tin chuyển nhượng 3/7: Gã khổng lồ trải thảm đỏ đón Ronaldo, Barca thôi bán De Jong', N'Hàng loạt ông lớn trải thảm đỏ đón Ronaldo hay Barca lại muốn giữ De Jong là những tin tức chuyển nhượng đáng chú ý hôm nay 3/7.', N'tin-chuyen-nhuong-3-7-ga-khong-lo-trai-tham-do-don-ronaldo-barca-thoi-ban-de-jong-154668.jpg', 8, CAST(N'2022-07-03T19:36:44.540' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (10, 2, N'MU để một cầu thủ ra đi, De Gea chắc suất bắt chính ở mùa giải tới', N'Dean Henderson chính thức rời MU.', N'deanhederson-afp_rytt-1656758761.jpg', 8, CAST(N'2022-07-03T19:37:18.610' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (11, 2, N'Son Heung-min: ''Tôi không đến World Cup để nhìn Ronaldo''', N'Son Heung-min cho rằng mục tiêu khi dự World Cup 2022 là giúp tuyển Hàn Quốc đi sâu nhất có thể.

', N'son-01-1915.jpg', 1, CAST(N'2022-07-05T21:56:31.423' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (12, 2, N'Messi và lời ước ở tuổi 35', N'Lionel Messi hiểu thời gian dành cho mình không còn nhiều và những gì anh mong muốn là một đoạn kết viên mãn trong sự nghiệp.', N'messi-va-loi-uoc-o-tuoi-35-181809.jpg', 1, CAST(N'2022-07-05T21:57:10.540' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (13, 2, N'FIFA áp dụng thay đổi tại World Cup 2022', N'Các đội tuyển tại World Cup 2022 sẽ được tăng số lượng cầu thủ đăng ký cho mỗi trận đấu từ 23 thành 26.', N'fifa-ap-dung-thay-doi-tai-world-cup-2022-143359.png', 1, CAST(N'2022-07-05T21:57:46.840' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (14, 2, N'Brazil vĩ đại và huyền thoại Vua Pele', N'Mexico 1970 mà Brazil vô địch vẫn được coi là kỳ World Cup hay nhất trong lịch sử, với sự tận hiến của Pele, của "Trận đấu của thế kỷ", của một pha cứu thua huyền thoại, hay của "bàn thắng không thành bàn"...', N'pele-01-1942.jpg', 1, CAST(N'2022-07-05T21:58:32.733' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (15, 2, N'Qatar đã sẵn sàng tổ chức World Cup?', N'Tháng 6 thường là thời điểm World Cup diễn ra nhưng việc Qatar được lựa chọn là nước chủ nhà đã thay đổi mọi thứ.', N'qatar-da-san-sang-to-chuc-world-cup-123447.jpg', 1, CAST(N'2022-07-05T21:58:39.877' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (16, 2, N'Phí phá vỡ hợp đồng của Haaland được tiết lộ', N'Mức phí giải phóng hợp đồng của tiền đạo Erling Haaland tại Man City vừa được báo chí châu Âu tiết lộ.', N'haaland-01-1954.jpg', 3, CAST(N'2022-07-05T22:12:32.547' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (17, 2, N'"M.U thất bại, người Hà Lan sẽ bị đổ tội"', N'Cựu danh thủ Ronald de Boer đã đưa ra lời nhắn cho người đồng hương Erik ten Hag tại Manchester United.', N'bdf66228-71c4-45c0-8830-64d5ceebcbc2-2307.jpg', 3, CAST(N'2022-07-05T22:13:15.327' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (18, 2, N'Ronaldo tiếp tục làm khó Man United', N'Tiền đạo 37 tuổi tiếp tục vắng mặt ở buổi tập thứ 2 của CLB chủ quản diễn ra vào ngày hôm nay (5/7).

', N'ronaldo-tiep-tuc-lam-kho-man-united-155054.png', 3, CAST(N'2022-07-05T22:13:52.557' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (19, 2, N'Vì sao Bayern Munich là sự lựa chọn hoàn hảo của Cristiano Ronaldo?', N'Chân sút người Bồ đang đến nấc thang cuối cùng của sự nghiệp và Bayern Munich có thể là điểm dừng chân ngọt ngào nhất.', N'vi-sao-bayern-munich-la-su-lua-chon-hoan-hao-cua-cristiano-ronaldo-191805.jpg', 3, CAST(N'2022-07-05T22:14:45.910' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (20, 2, N'5 điều rút ra sau buổi tập của Man Utd: Ronaldo vắng mặt, Hai ''người thừa'' muốn ghi điểm', N'Đã có những chuyển động rất đáng kể trên sân tập Man Utd kể từ khi đội bóng này hội quân trở lại.', N'1-2138.jpg', 3, CAST(N'2022-07-05T22:15:25.823' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (21, 3, N'Messi gọi điện cho Xavi, muốn quay lại Barca', N'Viễn cảnh Lionel Messi rời PSG chỉ sau một mùa giải để quay trở lại Barca bỗng hiển hiện khi thị trường chuyển nhượng mở cửa được ít ngày.', N'messi-goi-dien-cho-xavi-muon-quay-lai-barca-185822.jpg', 4, CAST(N'2022-07-05T22:26:10.340' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (22, 3, N'Real sắp công bố chữ ký mới', N'Real Madrid vẫn còn nhiều hoạt động để thực hiện trên bàn đàm phán vào thời điểm hiện tại.', N'real-sap-cong-bo-chu-ky-moi-105654.jpg', 4, CAST(N'2022-07-05T22:26:26.267' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (23, 3, N'Vì sao Dembele là bom xịt của Barca?', N'Nằm trong số những bản hợp đồng trên 100 triệu euro, Ousmane Dembele thất bại trong việc chứng tỏ giá trị bản thân.', N'vi-sao-dembele-la-bom-xit-cua-barca-184437.jpg', 4, CAST(N'2022-07-05T22:26:29.930' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (24, 3, N'Cơ bắp của dàn ngôi sao Bayern', N'Robert Lewandowski, Leon Goretzka, Alphonso Davies,... nằm trong số những cầu thủ phát triển cơ bắp nhanh chóng kể từ khi gia nhập Bayern Munich.', N'bayern-02-1947.jpg', 5, CAST(N'2022-07-05T22:32:25.700' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (25, 3, N'Cập bến Bayern, Mane vượt mặt Salah về mức thu nhập', N'Sadio Mane hiện đang là cầu thủ châu Phi hưởng thu nhập cao nhất thế giới, xếp trên Mohamed Salah.', N'cap-ben-bayern-mane-vuot-mat-salah-ve-muc-thu-nhap-105848.jpg', 5, CAST(N'2022-07-05T22:33:07.233' AS DateTime), 1)
INSERT [dbo].[News] ([NewsId], [AuthorId], [Title], [ShortDescription], [Thumbnail], [CategoryId], [DatePublished], [Status]) VALUES (26, 3, N'Giám đốc gặp trực tiếp, Lewandowski có thay đổi ý định?', N'Theo thông tin từ Sky, giám đốc thể thao của Bayern đã có mặt tại Mallorca để thuyết phục Robert Lewandowski.', N'lewandowski-01-1911.jpg', 5, CAST(N'2022-07-05T22:33:27.330' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Journalist')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Reader')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Avatar], [RoleId], [Code], [Status]) VALUES (1, N'Admin', N'datnthe153704@fpt.edu.vn', N'123456789dat', NULL, 1, NULL, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Avatar], [RoleId], [Code], [Status]) VALUES (2, N'NTD', N'nguyentiendatntd102@gmail.com', N'123456dat', NULL, 2, NULL, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Avatar], [RoleId], [Code], [Status]) VALUES (3, N'DatNT', N'nguyendat091011@gmail.com', N'123456dat', NULL, 2, NULL, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Avatar], [RoleId], [Code], [Status]) VALUES (4, N'Data', N'datagame21stcentury@gmail.com', N'123456', NULL, 3, NULL, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Avatar], [RoleId], [Code], [Status]) VALUES (5, N'RyuKen', N'davidandthiago43dat@gmail.com', N'123456', NULL, 3, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_DatePublished]  DEFAULT (getdate()) FOR [DatePublished]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([NewsId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD FOREIGN KEY([ImageId])
REFERENCES [dbo].[Image] ([ImageId])
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([NewsId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([AuthorId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
USE [master]
GO
ALTER DATABASE [FootballNews] SET  READ_WRITE 
GO
