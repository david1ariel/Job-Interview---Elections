USE [master]
GO
/****** Object:  Database [Elections2]    Script Date: 19/02/2021 06:27:56 ******/
CREATE DATABASE [Elections2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elections2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Elections2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elections2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Elections2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Elections2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elections2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elections2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elections2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elections2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elections2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elections2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elections2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elections2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elections2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elections2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elections2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elections2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elections2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elections2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elections2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elections2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elections2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elections2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elections2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elections2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elections2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elections2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elections2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elections2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Elections2] SET  MULTI_USER 
GO
ALTER DATABASE [Elections2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elections2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elections2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elections2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elections2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Elections2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Elections2] SET QUERY_STORE = OFF
GO
USE [Elections2]
GO
/****** Object:  Table [dbo].[Parties]    Script Date: 19/02/2021 06:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parties](
	[PartyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[ImageFileName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Parties] PRIMARY KEY CLUSTERED 
(
	[PartyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voters]    Script Date: 19/02/2021 06:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voters](
	[VoterId] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[CellPhone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IdProdDate] [date] NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_Voters] PRIMARY KEY CLUSTERED 
(
	[VoterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotersParties]    Script Date: 19/02/2021 06:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotersParties](
	[VotersPartyId] [int] IDENTITY(1,1) NOT NULL,
	[PartyId] [int] NOT NULL,
	[VoterId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VotersParties] PRIMARY KEY CLUSTERED 
(
	[VotersPartyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Parties] ON 

INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (1, N'ליכוד', N'הליכוד היא מפלגת ימין מתונה שהתמודדה על השלטון בכל שנות קיומה. הליכוד בראשותו של מנחם בגין תפס את השלטון לראשונה בשנת 1977 ונותר בו עד 1984. לאחר מכן המפלגה הייתה שותפה בשלוש ממשלות האחדות שכיהנו עד 1990. יצחק שמיר כיהן כראש ממשלה מטעם הליכוד בשנים 1986 1992. בשנה זו, לאחר יותר מחמש עשרה שנים בשלטון, חזר הליכוד לחבוש את ספסלי האופוזיציה, ושב לשלטון בראשות בנימין נתניהו בשנים 1999-1996 ופעם נוספת בראשות אריאל שרון בשנים 2005-2001. בשלהי 2005 חל פילוג במפלגה, עם פרישתו של אריאל שרון ושורה של חברי כנסת מהמפלגה והקמתה של קדימה. לאחר שלוש שנים באופוזיציה שב הליכוד למעמד של מפלגת השלטון, עם כניסתה לתפקיד של ממשלת נתניהו השנייה ב-31 במרס 2009. מאז נמצא הליכוד בשלטון.', N'likud_logo.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (2, N'יש עתיד', N'יש עתיד ממצבת עצמה כמפלגת מרכז ומתמקדת במצעה בנושאי חברתיים, אזרחיים ומשטריים ופחות בנושא המדיני-ביטחוני. בין היתר קוראת המפלגה לשינוי שיטת השלטון, צמצום גודל הממשלה והגבלת כהונת ראש הממשלה לשתי קדנציות. אחד הנושאים המרכזיים בו מתמקדת המפלגה הוא עניין החינוך. המפלגה דוגלת בשוויון בנטל ושואפת כי בתום שנים ספורות כל אזרח ישראלי ישרת שירות צבאי או אזרחי.', N'yesh_atid.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (3, N'תקווה חדשה', N'תקווה חדשה היא מפלגת ימין שנוסדה בדצמבר 2020, ערב הבחירות לכנסת ה-24, על-ידי גדעון סער לאחר שזה עזב את הליכוד. סער טען שהליכוד "הפכה לכלי שרת עבור האינטרסים האישיים של העומד בראשה", תוך שהוא רומז לשלטון היחיד שהנהיג יו"ר הליכוד בנימין נתניהו. יחד איתו הודיעו על פרישתם מסיעת הליכוד גם השר זאב אלקין, וחברות הכנסת מיכל שיר, שרן השכל ויפעת שאשא-ביטון. אל המפלגה החדשה הצטרפו גם הח"כים יועז הנדל וגדעון האוזר מסיעת דרך ארץ והח"כית הילה שי-וזאן מסיעת כחול לבן.', N'new-hope.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (4, N'ימינה', N'ימינה נוסדה לקראת הבחירות לכנסת ה-22 (ספטמבר 2019) כרשימה משותפת של שלוש מפלגות ימין. היא כללה נציגים מהימין החדש, הבית היהודי והאיחוד הלאומי-תקומה. בבחירות הראשונות בה התמודדה הרשימה (ספטמבר 2019) הוצבה בראש הרשימה איילת שקד. בבחירות העוקבות (2020) אייש נפתלי בנט את ראשות הרשימה. הרשימה התפרקה לקראת הבחירות לכנסת ה-24 (2021) לאחר שהאיחוד הלאומי-תקומה פרש ממנה. הבית היהודי לא יתמודד בבחירות 2021 אך הצהיר על תמיכה בימינה. כך, בבחירות אלה כוללת רשימת ימינה רק מועמדים מהימין החדש.', N'yamina.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (5, N'הרשימה המשותפת', N'הרשימה המשותפת הוא שמה של רשימת מועמדים משותפת שהוקמה לקראת הבחירות לכנסת ה-20 וכללה מועמדים משלוש מפלגות ערביות (רע"מ, בל"ד ותע"ל) ומחד"ש. למרות ההבדלים האידיאולוגיים הניכרים בין המפלגות, הן איחדו כוחות מתוך כוונה להתגבר על אחוז החסימה שהועלה לקראת הבחירות לערך גבוה של 3.25%. הרשימה זכתה ב-13 מנדטים שהציבו אותה כסיעה השלישית בגודלה בכנסת. לקראת הבחירות לכנסת ה-21 (אפריל 2019) הרשימה התפרקה לשניים: חד"ש-תע"ל ורע"מ-בל"ד התמודדו בנפרד. הרשימה הוקמה מחדש חודשים ספורים לאחר מכן והתמודדה בבחירות לכנסות ה-22 (ספטמבר 2019) וה-23 (2020). בבחירות 2020 הגיעה לשיא ייצוג של 15 מנדטים. לקראת בחירות 2021 עזבה רע"מ את הרשימה.', N'reshima.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (6, N'ש"ס', N'ש"ס דוגלת ב"החזרת עטרה ליושנה" ובקידום הצדק החברתי. התנועה דוגלת בקיומה של מדינת ישראל כמדינת העם היהודי, ושואפת לקבץ בה את יהודי העולם. מבחינה ביטחונית-מדינית המפלגה תומכת בהסדרי שלום עם מדינות ערב תוך שמירה על ביטחונם של תושבי ישראל, אך עם זאת מתנגדת לחלוקת ירושלים. בשורה של הצבעות מפתח בסוגיות מדיניות היא הפגינה קו ניצי ימני.', N'ss.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (7, N'יהדות התורה', N'הרשימה פועלת לקידום האינטרסים של המגזר שהיא מייצגת בתחומי החינוך והרווחה ובנושאים ממוקדים כמו גיוס לצבא. עוד פועלת המפלגה לשימור הצביון הדתי במדינה, ובספטמבר 1999 (הכנסת החמש עשרה) אף פרשה מהקואליציה בשל שינוע בשבת של משחנים לתחנת הכוח באשקלון. בנושאי חוץ וביטחון יהדות התורה ניצבת במרכז, וכל החלטה שלה כפופה לשיקולים תורניים ולא ביטחוניים-מדיניים דווקא. הרשימה הייתה שותפה לממשלה שביצעה את תכנית ההתנתקות מחבל עזה. עם זאת הרשימה נוטה בדרך כלל לתמוך במחנה הימין בשל מאפייניו השמרניים יותר בנושאי דת ומדינה.', N'yahadut-hatorah.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (8, N'ישראל ביתנו', N'ישראל ביתנו מציגה שילוב של עמדות ימניות-נציות בתחום המדיני-ביטחוני לצד עמדות חילוניות-אזרחיות בשסע הדתי-חילוני. היא תומכת בפתרון מדיני המתבסס על חילופי אוכלוסין ויצירת שתי מדינות בעלות אוכלוסייה הומוגנית מבחינה לאומית. המפלגה מחזיקה בעמדות ימניות גם בנושא הכלכלי, ובמצעה היא מחויבת לעידוד היוזמה הפרטית. נושא שמעסיק רבות את המפלגה הוא מבנה המשטר בישראל: במטרה לייצב את המערכת הפוליטית המפלגה מציעה לאמץ שיטת ממשל נשיאותית. למרות זיהויה כמפלגת ימין מובהקת, היא מוצבה מחדש לאחר הבחירות לכנסת ה-21 (אפריל 2019) כמפלגת מרכז. זאת, עקב התנגדותה להקמת ממשלה של הליכוד והמפלגות החרדיות. מאז הבחירות של ספטמבר 2019 ישראל ביתנו נחשבת לאחת המפלגות הביקורתיות ביותר נגד ראש הממשלה נתניהו ומשתייכת לגוש מתנגדיו.', N'beytenu.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (9, N'העבודה', N'בהיותה ממשיכת דרכה של מפא"י, גם מפלגת העבודה התבססה על אידאולוגיה ציונית-סוציאליסטית מתונה. היא המשיכה את הזיקה להסתדרות העובדים הכללית, אך מאמצע שנות התשעים התמתנה מכוּונותה הכלכלית-חברתית לכיוון של סוציאל-דמוקרטיה. מבחינה מדינית במשך השנים נדדה המפלגה שמאלה, והייתה המפלגה הראשית הראשונה שקראה למשא ומתן עם אש"ף ותמכה בנוסחה של שתי מדינות לשני עמים. בנושאי דת ומדינה נקרעה מפלגת העבודה במשך השנים בין עמדותיה האידאולוגיות ובין חוסר רצונה להתעמת עם המפלגות הדתיות, שותפותיה הקואליציוניות. לאחר מהפך 1977, כשניתקה הברית עם הדתיים, הציגה המפלגה בחופשיות יותר את עמדותיה בתחום זה לרבות הבטחת מעמד מוכר לכל זרמי היהדות ותמיכה בגיוס בחורי ישיבות.
', N'haavoda.jpg')
INSERT [dbo].[Parties] ([PartyId], [Name], [Description], [ImageFileName]) VALUES (10, N'מרץ', N'מרצ ממוקמת בשמאל הציוני של המפה הפוליטית הישראלית ותומכת באופן מסורתי בשוויון חברתי, בהשוואת הזכויות של ערביי ישראל ובפתרון של שתי מדינות לשני עמים. היא דוגלת בחתירה לשלום מתוך ויתור על השטחים הכבושים והפסקת מפעל ההתנחלויות. עוד תומכת מרצ בהפרדת הדת מהמדינה ומתנגדת לכפייה הדתית. מרצ מגדירה את עצמה מפלגה סוציאל-דמוקרטית, ותומכת בשימור ואף בהרחבה של מדינת הרווחה.', N'meretz_logo.jpg')
SET IDENTITY_INSERT [dbo].[Parties] OFF
GO
INSERT [dbo].[Voters] ([VoterId], [FullName], [Gender], [CellPhone], [Email], [IdProdDate], [City]) VALUES (N'012345671', N'קיפי בן קיפוד', N'זכר', N'0503456784', N'kipi@ben-kipod.com', CAST(N'2015-12-03' AS Date), N'ירושלים')
INSERT [dbo].[Voters] ([VoterId], [FullName], [Gender], [CellPhone], [Email], [IdProdDate], [City]) VALUES (N'012345672', N'עוגי פלצת', N'זכר', N'0150456714', N'ugi@fletzet', CAST(N'2017-09-05' AS Date), N'באר שבע')
INSERT [dbo].[Voters] ([VoterId], [FullName], [Gender], [CellPhone], [Email], [IdProdDate], [City]) VALUES (N'012345673', N'קרמיט הצפרדע', N'זכר', N'0523456724', N'kermit@the-frog.com', CAST(N'2000-11-04' AS Date), N'חיפה')
INSERT [dbo].[Voters] ([VoterId], [FullName], [Gender], [CellPhone], [Email], [IdProdDate], [City]) VALUES (N'012345675', N'יוסי כהן', N'זכר', N'0543456738', N'yosi@cohen.com', CAST(N'1993-08-03' AS Date), N'ירושלים')
INSERT [dbo].[Voters] ([VoterId], [FullName], [Gender], [CellPhone], [Email], [IdProdDate], [City]) VALUES (N'012345678', N'מוישה אופניק', N'זכר', N'0501234567', N'moishe@ufnik.com', CAST(N'2019-10-21' AS Date), N'תל אביב')
GO
SET IDENTITY_INSERT [dbo].[VotersParties] ON 

INSERT [dbo].[VotersParties] ([VotersPartyId], [PartyId], [VoterId]) VALUES (4, 3, N'012345671')
INSERT [dbo].[VotersParties] ([VotersPartyId], [PartyId], [VoterId]) VALUES (5, 1, N'012345671')
INSERT [dbo].[VotersParties] ([VotersPartyId], [PartyId], [VoterId]) VALUES (6, 8, N'012345671')
INSERT [dbo].[VotersParties] ([VotersPartyId], [PartyId], [VoterId]) VALUES (7, 1, N'012345672')
INSERT [dbo].[VotersParties] ([VotersPartyId], [PartyId], [VoterId]) VALUES (8, 8, N'012345678')
INSERT [dbo].[VotersParties] ([VotersPartyId], [PartyId], [VoterId]) VALUES (9, 5, N'012345675')
SET IDENTITY_INSERT [dbo].[VotersParties] OFF
GO
ALTER TABLE [dbo].[VotersParties]  WITH CHECK ADD  CONSTRAINT [FK_VotersParties_Parties] FOREIGN KEY([PartyId])
REFERENCES [dbo].[Parties] ([PartyId])
GO
ALTER TABLE [dbo].[VotersParties] CHECK CONSTRAINT [FK_VotersParties_Parties]
GO
ALTER TABLE [dbo].[VotersParties]  WITH CHECK ADD  CONSTRAINT [FK_VotersParties_Voters] FOREIGN KEY([VoterId])
REFERENCES [dbo].[Voters] ([VoterId])
GO
ALTER TABLE [dbo].[VotersParties] CHECK CONSTRAINT [FK_VotersParties_Voters]
GO
USE [master]
GO
ALTER DATABASE [Elections2] SET  READ_WRITE 
GO
