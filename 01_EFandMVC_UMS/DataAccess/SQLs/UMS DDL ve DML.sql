-- Bu SQL script'i sadece veritabanı yapısı ile ilk verileri görebilmek için oluşturulmuştur,
-- proje geliştirme için çalıştırılmamalıdır.
-- Veritabanı entity ve database context'teki DbSet'ler üzerinden Entity Framework Code First
-- yaklaşımı, ilk veriler de projedeki Db controller'ın Seed action'ı üzerinden oluşturulmalıdır.

/****** Object:  Table [dbo].[Roles]    Script Date: 28.11.2023 18:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](max) NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.11.2023 18:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](max) NULL,
	[UserName] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Sex] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Guid], [Name]) VALUES (1, NULL, N'Admin')
GO
INSERT [dbo].[Roles] ([Id], [Guid], [Name]) VALUES (2, NULL, N'User')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Guid], [UserName], [Password], [IsActive], [BirthDate], [Sex], [RoleId]) VALUES (1, NULL, N'cagil', N'cagil', 1, CAST(N'1980-05-27T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Users] ([Id], [Guid], [UserName], [Password], [IsActive], [BirthDate], [Sex], [RoleId]) VALUES (2, NULL, N'luna', N'luna', 1, CAST(N'2022-09-23T00:00:00.0000000' AS DateTime2), 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
