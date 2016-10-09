USE [AdventureWorksDW]
GO

ALTER TABLE [dbo].[FactCurrencyRate] DROP CONSTRAINT [FK_FactCurrencyRate_DimTime]
GO

ALTER TABLE [dbo].[FactCurrencyRate] DROP CONSTRAINT [FK_FactCurrencyRate_DimCurrency]
GO

/****** Object:  Table [dbo].[FactCurrencyRate]    Script Date: 11/1/2014 5:16:47 PM ******/
DROP TABLE [dbo].[FactCurrencyRate]
GO

/****** Object:  Table [dbo].[FactCurrencyRate]    Script Date: 11/1/2014 5:16:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactCurrencyRate](
	[CurrencyKey] [int] NOT NULL,
	[TimeKey] [int] NOT NULL,
	[AverageRate] [float] NOT NULL,
	[EndOfDayRate] [float] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FactCurrencyRate]  WITH CHECK ADD  CONSTRAINT [FK_FactCurrencyRate_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO

ALTER TABLE [dbo].[FactCurrencyRate] CHECK CONSTRAINT [FK_FactCurrencyRate_DimCurrency]
GO

ALTER TABLE [dbo].[FactCurrencyRate]  WITH CHECK ADD  CONSTRAINT [FK_FactCurrencyRate_DimTime] FOREIGN KEY([TimeKey])
REFERENCES [dbo].[DimTime] ([TimeKey])
GO

ALTER TABLE [dbo].[FactCurrencyRate] CHECK CONSTRAINT [FK_FactCurrencyRate_DimTime]
GO

