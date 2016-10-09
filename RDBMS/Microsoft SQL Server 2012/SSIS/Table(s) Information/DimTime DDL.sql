USE [AdventureWorksDW]
GO

/****** Object:  Table [dbo].[DimTime]    Script Date: 11/1/2014 5:17:42 PM ******/
DROP TABLE [dbo].[DimTime]
GO

/****** Object:  Table [dbo].[DimTime]    Script Date: 11/1/2014 5:17:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DimTime](
	[TimeKey] [int] IDENTITY(1,1) NOT NULL,
	[FullDateAlternateKey] [datetime] NULL,
	[DayNumberOfWeek] [tinyint] NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NULL,
	[SpanishDayNameOfWeek] [nvarchar](10) NULL,
	[FrenchDayNameOfWeek] [nvarchar](10) NULL,
	[DayNumberOfMonth] [tinyint] NULL,
	[DayNumberOfYear] [smallint] NULL,
	[WeekNumberOfYear] [tinyint] NULL,
	[EnglishMonthName] [nvarchar](10) NULL,
	[SpanishMonthName] [nvarchar](10) NULL,
	[FrenchMonthName] [nvarchar](10) NULL,
	[MonthNumberOfYear] [tinyint] NULL,
	[CalendarQuarter] [tinyint] NULL,
	[CalendarYear] [char](4) NULL,
	[CalendarSemester] [tinyint] NULL,
	[FiscalQuarter] [tinyint] NULL,
	[FiscalYear] [char](4) NULL,
	[FiscalSemester] [tinyint] NULL,
 CONSTRAINT [PK_DimTime_TimeKey] PRIMARY KEY CLUSTERED 
(
	[TimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimTime_FullDateAlternateKey] UNIQUE NONCLUSTERED 
(
	[FullDateAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

