USE [Clinic]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolesId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RolesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RolesId], [RoleName], [Description]) VALUES (1, N'Manager', N'Can Manage Everything')
INSERT [dbo].[Roles] ([RolesId], [RoleName], [Description]) VALUES (2, N'Doctor', N'Cures Patient')
INSERT [dbo].[Roles] ([RolesId], [RoleName], [Description]) VALUES (3, N'Counselor', N'Assigning Patient to doctors')
INSERT [dbo].[Roles] ([RolesId], [RoleName], [Description]) VALUES (4, N'Patient', N'A person who is sick and wants an appointment')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[AssessmentQuestions]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentQuestions](
	[AssessmentQuestionsId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
 CONSTRAINT [PK_AssenssmentQuestions] PRIMARY KEY CLUSTERED 
(
	[AssessmentQuestionsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssessmentQuestions] ON
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (1, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Little interest or pleasure in doing things?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (2, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Feeling down, depressed or hopless?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (3, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Trouble falling asleep, staying asleep, or sleeping too much?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (4, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Feeling tired or having little energy?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (5, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Poor appetite or overeating?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (6, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Feeling bad about yourself - or that you''re a failure or have let yourself or your family down?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (7, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Trouble concentrating on things, such as reading the newspaper or watching television?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (8, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Moving or speaking so slowly that other people could have noticed. Or, the opposite - being so fidgety or restless that you have been moving around a lot more than usual?')
INSERT [dbo].[AssessmentQuestions] ([AssessmentQuestionsId], [Question]) VALUES (9, N'Over the past 2 weeks, how often have you been bothered by any of the following problems: Thoughts that you would be better off dead or of hurting yourself in some way?')
SET IDENTITY_INSERT [dbo].[AssessmentQuestions] OFF
/****** Object:  Table [dbo].[AssessmentAnswers]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentAnswers](
	[AssessmentAnswersId] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_AssessmentAnswers] PRIMARY KEY CLUSTERED 
(
	[AssessmentAnswersId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssessmentAnswers] ON
INSERT [dbo].[AssessmentAnswers] ([AssessmentAnswersId], [Answer]) VALUES (1, N'Not At All')
INSERT [dbo].[AssessmentAnswers] ([AssessmentAnswersId], [Answer]) VALUES (2, N'Several Days')
INSERT [dbo].[AssessmentAnswers] ([AssessmentAnswersId], [Answer]) VALUES (3, N'More Than Half The Days')
INSERT [dbo].[AssessmentAnswers] ([AssessmentAnswersId], [Answer]) VALUES (4, N'Nearly Every Day')
SET IDENTITY_INSERT [dbo].[AssessmentAnswers] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UsersId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleNo] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[last_login_datetime] [datetime] NULL,
	[creation_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsersId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (1, N'manager@clinic.com', N'manager123', 1, 1, CAST(0x0000AF4A00F5283E AS DateTime), CAST(0x0000AF3A0185F0D8 AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (5, N'gagan2807@gmail.com', N'123', 4, 1, CAST(0x0000AF4A003A8473 AS DateTime), CAST(0x0000AF3D012FD71E AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (10, N'ga@clinic.com', N'asd123', 4, 1, NULL, CAST(0x0000AF3E015653EC AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (19, N'PatientTest@clinic.com', N'test', 4, 1, CAST(0x0000AF3E017F1D3A AS DateTime), CAST(0x0000AF3E01646C07 AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (20, N'DoctorTest1@clinic.com', N'password', 2, 1, CAST(0x0000AF3E017ECA7B AS DateTime), CAST(0x0000AF3E01664367 AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (22, N'malzzy99@zohomail.com', N'Malay@1234', 3, 1, CAST(0x0000AF4B013821B2 AS DateTime), CAST(0x0000AF3E017D7348 AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (23, N'Patient@clinic.com', N'password', 4, 1, CAST(0x0000AF3E01809067 AS DateTime), CAST(0x0000AF3E01803AD2 AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (24, N'Doctor@clinic.com', N'password', 2, 1, CAST(0x0000AF3F00063432 AS DateTime), CAST(0x0000AF3E01814EAC AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (30, N'safrin.nabi@gmail.com', N'1234', 4, 1, CAST(0x0000AF3F00FA668E AS DateTime), CAST(0x0000AF3F00FA16BF AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (31, N'shabuj@gmail.com', N'1234', 4, 1, NULL, CAST(0x0000AF3F00FFBABC AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (32, N'abc@gmail.com', N'1234', 2, 1, CAST(0x0000AF4A00FF03CB AS DateTime), CAST(0x0000AF3F01004107 AS DateTime))
INSERT [dbo].[Users] ([UsersId], [Email], [Password], [RoleNo], [IsActive], [last_login_datetime], [creation_datetime]) VALUES (33, N'afrin.nabi@gmail.com', N'1234', 4, 1, CAST(0x0000AF3F0100F13F AS DateTime), CAST(0x0000AF3F0100DCAE AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Doctors]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorsId] [int] IDENTITY(1,1) NOT NULL,
	[UsersNo] [int] NOT NULL,
	[FullName] [nvarchar](500) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Registration_Approval_DateTime] [date] NULL,
	[IsApproved] [bit] NOT NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON
INSERT [dbo].[Doctors] ([DoctorsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [Registration_Approval_DateTime], [IsApproved], [RegistrationNumber]) VALUES (2, 20, N'DoctorTest1', N'1213', N'H2X2C9', CAST(0x5E440B00 AS Date), N'11111', CAST(0x99440B00 AS Date), 1, N'123')
INSERT [dbo].[Doctors] ([DoctorsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [Registration_Approval_DateTime], [IsApproved], [RegistrationNumber]) VALUES (4, 24, N'Doctor', N'11', N'11', CAST(0x65440B00 AS Date), N'1111', NULL, 0, N'Doctor')
INSERT [dbo].[Doctors] ([DoctorsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [Registration_Approval_DateTime], [IsApproved], [RegistrationNumber]) VALUES (6, 32, N'Rui Sweaea', N'Evo Montreal', N'H3C3Z7', CAST(0x30170B00 AS Date), N'5145180474', CAST(0x9A440B00 AS Date), 1, N'45235409913')
SET IDENTITY_INSERT [dbo].[Doctors] OFF
/****** Object:  Table [dbo].[Counselors]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counselors](
	[CounselorsId] [int] IDENTITY(1,1) NOT NULL,
	[UsersNo] [int] NOT NULL,
	[FullName] [nvarchar](500) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Registration_Approval_DateTime] [date] NULL,
	[IsApproved] [bit] NOT NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Counselors] PRIMARY KEY CLUSTERED 
(
	[CounselorsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Counselors] ON
INSERT [dbo].[Counselors] ([CounselorsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [Registration_Approval_DateTime], [IsApproved], [RegistrationNumber]) VALUES (10, 22, N'Counselor123123', N'331', N'444', CAST(0x82440B00 AS Date), N'22', CAST(0x99440B00 AS Date), 1, N'C1')
SET IDENTITY_INSERT [dbo].[Counselors] OFF
/****** Object:  Table [dbo].[Patients]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientsId] [int] IDENTITY(1,1) NOT NULL,
	[UsersNo] [int] NOT NULL,
	[FullName] [nvarchar](500) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Patients] ON
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (1, 5, N'Malay1', N'Evo Montreal', N'H3C3Z7', CAST(0x27230B00 AS Date), N'+15145697493', 0)
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (3, 10, N'gag', N'93as', N'asds', CAST(0x5D3F0B00 AS Date), N'647688888', 0)
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (4, 19, N'PatientTest', N'Evo Montreal', N'H3C3Z7', CAST(0x51400B00 AS Date), N'1133', 0)
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (5, 23, N'Patient', N'11', N'11', CAST(0x8E440B00 AS Date), N'231', 0)
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (7, 30, N'Safrin Nabi', N'5725 Cote-Saint-Luc', N'H3X 2E6', CAST(0xC53A0B00 AS Date), N'5145180474', 0)
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (8, 31, N'A K M Saifun Nabi', N'5725 Cote-Saint-Luc', N'H3C3Z7', CAST(0xF8120B00 AS Date), N'4383780474', 0)
INSERT [dbo].[Patients] ([PatientsId], [UsersNo], [FullName], [Adress], [PostalCode], [DateOfBirth], [PhoneNumber], [IsDeleted]) VALUES (9, 33, N'A K M Afrin', N'5725 Cote-St-Luc', N'H3X 2E6', CAST(0x0B1A0B00 AS Date), N'5145180724', 0)
SET IDENTITY_INSERT [dbo].[Patients] OFF
/****** Object:  View [dbo].[vwFullPatientInfo]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFullPatientInfo]
AS
SELECT     dbo.Patients.FullName, dbo.Patients.Adress, dbo.Patients.IsDeleted, dbo.Patients.PhoneNumber, dbo.Patients.DateOfBirth, dbo.Patients.PostalCode, dbo.Patients.PatientsId, dbo.Users.UsersId, 
                      dbo.Users.Email, dbo.Users.Password, dbo.Users.IsActive, dbo.Users.last_login_datetime, dbo.Users.creation_datetime, dbo.Roles.RoleName, dbo.Roles.Description, dbo.Roles.RolesId, 
                      dbo.Patients.UsersNo
FROM         dbo.Patients INNER JOIN
                      dbo.Users ON dbo.Patients.UsersNo = dbo.Users.UsersId LEFT OUTER JOIN
                      dbo.Roles ON dbo.Users.RoleNo = dbo.Roles.RolesId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Patients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 234
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 176
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Roles"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 161
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFullPatientInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFullPatientInfo'
GO
/****** Object:  View [dbo].[vwFullDoctorInfo]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFullDoctorInfo]
AS
SELECT     dbo.Users.Email, dbo.Users.Password, dbo.Users.IsActive, dbo.Users.last_login_datetime, dbo.Users.creation_datetime, dbo.Doctors.FullName, dbo.Doctors.Adress, dbo.Users.UsersId, 
                      dbo.Doctors.DoctorsId, dbo.Doctors.PostalCode, dbo.Doctors.DateOfBirth, dbo.Doctors.PhoneNumber, dbo.Doctors.Registration_Approval_DateTime, dbo.Doctors.IsApproved, dbo.Roles.RoleName, 
                      dbo.Roles.Description, dbo.Roles.RolesId, dbo.Doctors.RegistrationNumber, dbo.Doctors.UsersNo
FROM         dbo.Users INNER JOIN
                      dbo.Doctors ON dbo.Users.UsersId = dbo.Doctors.UsersNo LEFT OUTER JOIN
                      dbo.Roles ON dbo.Users.RoleNo = dbo.Roles.RolesId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 25
               Left = 272
               Bottom = 215
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 8
               Left = 482
               Bottom = 204
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Roles"
            Begin Extent = 
               Top = 39
               Left = 49
               Bottom = 144
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFullDoctorInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFullDoctorInfo'
GO
/****** Object:  View [dbo].[vwFullCounselorInfo]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFullCounselorInfo]
AS
SELECT     dbo.Roles.RolesId, dbo.Roles.RoleName, dbo.Roles.Description, dbo.Users.UsersId, dbo.Users.Password, dbo.Users.Email, dbo.Users.IsActive, dbo.Users.last_login_datetime, 
                      dbo.Users.creation_datetime, dbo.Counselors.CounselorsId, dbo.Counselors.FullName, dbo.Counselors.Adress, dbo.Counselors.PostalCode, dbo.Counselors.DateOfBirth, 
                      dbo.Counselors.PhoneNumber, dbo.Counselors.Registration_Approval_DateTime, dbo.Counselors.IsApproved, dbo.Counselors.RegistrationNumber, dbo.Counselors.UsersNo
FROM         dbo.Counselors INNER JOIN
                      dbo.Users ON dbo.Counselors.UsersNo = dbo.Users.UsersId INNER JOIN
                      dbo.Roles ON dbo.Users.RoleNo = dbo.Roles.RolesId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[6] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Roles"
            Begin Extent = 
               Top = 11
               Left = 651
               Bottom = 116
               Right = 811
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Counselors"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 217
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 9
               Left = 378
               Bottom = 179
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5850
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFullCounselorInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFullCounselorInfo'
GO
/****** Object:  Table [dbo].[PatientAppointments]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAppointments](
	[PatientAppointmentsId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[Appoint_Scheduled_DateTime] [datetime] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[DoctorsNo] [int] NULL,
	[CounselorsNo] [int] NULL,
	[PatientsNo] [int] NOT NULL,
	[Iscancelled] [bit] NOT NULL,
 CONSTRAINT [PK_PatientAppointments] PRIMARY KEY CLUSTERED 
(
	[PatientAppointmentsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PatientAppointments] ON
INSERT [dbo].[PatientAppointments] ([PatientAppointmentsId], [AppointmentDate], [Appoint_Scheduled_DateTime], [Status], [DoctorsNo], [CounselorsNo], [PatientsNo], [Iscancelled]) VALUES (3, CAST(0xA3440B00 AS Date), CAST(0x0000AF4A00FDC7DB AS DateTime), N'Assigned to Doctor', 6, 10, 1, 0)
SET IDENTITY_INSERT [dbo].[PatientAppointments] OFF
/****** Object:  Table [dbo].[PatientAppointmentAssessment]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAppointmentAssessment](
	[PatientAppointmentAssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientAppointmentsNo] [int] NOT NULL,
	[AssessmentQuestionsNo] [int] NOT NULL,
	[AssessmentAnswersNo] [int] NOT NULL,
 CONSTRAINT [PK_PatientAppointmentAssessment] PRIMARY KEY CLUSTERED 
(
	[PatientAppointmentAssessmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PatientAppointmentAssessment] ON
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (1, 3, 1, 2)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (2, 3, 2, 3)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (3, 3, 3, 3)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (4, 3, 4, 4)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (5, 3, 5, 3)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (6, 3, 6, 2)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (7, 3, 7, 2)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (8, 3, 8, 2)
INSERT [dbo].[PatientAppointmentAssessment] ([PatientAppointmentAssessmentId], [PatientAppointmentsNo], [AssessmentQuestionsNo], [AssessmentAnswersNo]) VALUES (9, 3, 9, 3)
SET IDENTITY_INSERT [dbo].[PatientAppointmentAssessment] OFF
/****** Object:  View [dbo].[vwPatientAppointmentInfo]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPatientAppointmentInfo]
AS
SELECT     dbo.Patients.FullName AS PatientName, dbo.Doctors.FullName AS DoctorName, dbo.Counselors.FullName AS CounselorName, dbo.PatientAppointments.PatientAppointmentsId, 
                      dbo.PatientAppointments.AppointmentDate, dbo.PatientAppointments.Appoint_Scheduled_DateTime, dbo.PatientAppointments.Status, dbo.PatientAppointments.DoctorsNo, 
                      dbo.PatientAppointments.CounselorsNo, dbo.PatientAppointments.PatientsNo, dbo.PatientAppointments.Iscancelled, dbo.Patients.PhoneNumber, dbo.Users.Email, 
                      'AP - ' + CAST(dbo.PatientAppointments.PatientAppointmentsId AS varchar) AS AppointmentCode
FROM         dbo.Patients LEFT OUTER JOIN
                      dbo.Users ON dbo.Patients.UsersNo = dbo.Users.UsersId RIGHT OUTER JOIN
                      dbo.PatientAppointments ON dbo.Patients.PatientsId = dbo.PatientAppointments.PatientsNo LEFT OUTER JOIN
                      dbo.Doctors ON dbo.PatientAppointments.DoctorsNo = dbo.Doctors.DoctorsId LEFT OUTER JOIN
                      dbo.Counselors ON dbo.PatientAppointments.CounselorsNo = dbo.Counselors.CounselorsId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[44] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -1078
      End
      Begin Tables = 
         Begin Table = "Patients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 192
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 276
               Left = 121
               Bottom = 396
               Right = 303
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PatientAppointments"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 200
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 0
               Left = 508
               Bottom = 159
               Right = 755
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Counselors"
            Begin Extent = 
               Top = 167
               Left = 504
               Bottom = 367
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9000
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPatientAppointmentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 2160
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPatientAppointmentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPatientAppointmentInfo'
GO
/****** Object:  View [dbo].[vwPatientAppointmentSelfAssessmentInfo]    Script Date: 11/12/2022 19:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPatientAppointmentSelfAssessmentInfo]
AS
SELECT     dbo.AssessmentAnswers.Answer, dbo.PatientAppointmentAssessment.*, dbo.AssessmentQuestions.Question
FROM         dbo.PatientAppointmentAssessment LEFT OUTER JOIN
                      dbo.AssessmentQuestions ON dbo.PatientAppointmentAssessment.AssessmentQuestionsNo = dbo.AssessmentQuestions.AssessmentQuestionsId LEFT OUTER JOIN
                      dbo.AssessmentAnswers ON dbo.PatientAppointmentAssessment.AssessmentAnswersNo = dbo.AssessmentAnswers.AssessmentAnswersId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[11] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PatientAppointmentAssessment"
            Begin Extent = 
               Top = 24
               Left = 330
               Bottom = 144
               Right = 581
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssessmentAnswers"
            Begin Extent = 
               Top = 46
               Left = 67
               Bottom = 145
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssessmentQuestions"
            Begin Extent = 
               Top = 47
               Left = 650
               Bottom = 137
               Right = 854
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPatientAppointmentSelfAssessmentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPatientAppointmentSelfAssessmentInfo'
GO
/****** Object:  Default [DF_PatientAppointments_AppointmentDateTime]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointments] ADD  CONSTRAINT [DF_PatientAppointments_AppointmentDateTime]  DEFAULT (getdate()) FOR [AppointmentDate]
GO
/****** Object:  Default [DF_PatientAppointments_Status]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointments] ADD  CONSTRAINT [DF_PatientAppointments_Status]  DEFAULT (N'Requested') FOR [Status]
GO
/****** Object:  Default [DF_PatientAppointments_Iscancelled]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointments] ADD  CONSTRAINT [DF_PatientAppointments_Iscancelled]  DEFAULT ((0)) FOR [Iscancelled]
GO
/****** Object:  Default [DF_Users_IsActive]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Users_creation_datetime]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_creation_datetime]  DEFAULT (getdate()) FOR [creation_datetime]
GO
/****** Object:  ForeignKey [FK_Counselors_Users]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[Counselors]  WITH CHECK ADD  CONSTRAINT [FK_Counselors_Users] FOREIGN KEY([UsersNo])
REFERENCES [dbo].[Users] ([UsersId])
GO
ALTER TABLE [dbo].[Counselors] CHECK CONSTRAINT [FK_Counselors_Users]
GO
/****** Object:  ForeignKey [FK_Doctors_Users]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Users] FOREIGN KEY([UsersNo])
REFERENCES [dbo].[Users] ([UsersId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Users]
GO
/****** Object:  ForeignKey [FK_PatientAppointmentAssessment_AssessmentAnswers]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointmentAssessment]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointmentAssessment_AssessmentAnswers] FOREIGN KEY([AssessmentAnswersNo])
REFERENCES [dbo].[AssessmentAnswers] ([AssessmentAnswersId])
GO
ALTER TABLE [dbo].[PatientAppointmentAssessment] CHECK CONSTRAINT [FK_PatientAppointmentAssessment_AssessmentAnswers]
GO
/****** Object:  ForeignKey [FK_PatientAppointmentAssessment_AssessmentQuestions]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointmentAssessment]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointmentAssessment_AssessmentQuestions] FOREIGN KEY([AssessmentQuestionsNo])
REFERENCES [dbo].[AssessmentQuestions] ([AssessmentQuestionsId])
GO
ALTER TABLE [dbo].[PatientAppointmentAssessment] CHECK CONSTRAINT [FK_PatientAppointmentAssessment_AssessmentQuestions]
GO
/****** Object:  ForeignKey [FK_PatientAppointmentAssessment_PatientAppointments]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointmentAssessment]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointmentAssessment_PatientAppointments] FOREIGN KEY([PatientAppointmentsNo])
REFERENCES [dbo].[PatientAppointments] ([PatientAppointmentsId])
GO
ALTER TABLE [dbo].[PatientAppointmentAssessment] CHECK CONSTRAINT [FK_PatientAppointmentAssessment_PatientAppointments]
GO
/****** Object:  ForeignKey [FK_PatientAppointments_Counselors]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointments]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointments_Counselors] FOREIGN KEY([CounselorsNo])
REFERENCES [dbo].[Counselors] ([CounselorsId])
GO
ALTER TABLE [dbo].[PatientAppointments] CHECK CONSTRAINT [FK_PatientAppointments_Counselors]
GO
/****** Object:  ForeignKey [FK_PatientAppointments_Doctors]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointments]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointments_Doctors] FOREIGN KEY([DoctorsNo])
REFERENCES [dbo].[Doctors] ([DoctorsId])
GO
ALTER TABLE [dbo].[PatientAppointments] CHECK CONSTRAINT [FK_PatientAppointments_Doctors]
GO
/****** Object:  ForeignKey [FK_PatientAppointments_Patients]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[PatientAppointments]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointments_Patients] FOREIGN KEY([PatientsNo])
REFERENCES [dbo].[Patients] ([PatientsId])
GO
ALTER TABLE [dbo].[PatientAppointments] CHECK CONSTRAINT [FK_PatientAppointments_Patients]
GO
/****** Object:  ForeignKey [FK_Patients_Users]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Users] FOREIGN KEY([UsersNo])
REFERENCES [dbo].[Users] ([UsersId])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Users]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 11/12/2022 19:12:05 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleNo])
REFERENCES [dbo].[Roles] ([RolesId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
