CREATE TABLE [dbo].[AMP_Generic_Country]
(
[CountryId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AreaCode] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LanguageId] [int] NOT NULL,
[ISOAlpha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GlobalLocationId] [int] NULL,
[CurrencyId] [int] NULL,
[CurrencySymbol] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sanctioned] [bit] NULL,
[CurrencyToProviderFlag] [bit] NULL,
[IsHighRiskNationality] [bit] NULL,
[IsHighRiskSourceOfFunding] [bit] NULL,
[IsHighRiskCountryOfResidence] [bit] NULL,
[ISO2Alpha] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE TRIGGER [dbo].[Trg_SQLcm_AMP_Generic_Country] ON [dbo].[AMP_Generic_Country]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS EXTERNAL NAME [Trg_SQLcm_dbo_AMP_Generic_Country].[CLRTriggers].[DMLTrigger]
GO
ALTER TABLE [dbo].[AMP_Generic_Country] ADD CONSTRAINT [AMP_Generic_Country_PK] PRIMARY KEY CLUSTERED ([CountryId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_Country] ADD CONSTRAINT [Unique_AMP_Generic_Country_Name] UNIQUE NONCLUSTERED ([Name]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_Country] ADD CONSTRAINT [AMP_Generic_Language_AMP_Generic_Country_FK1] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[AMP_Generic_Language] ([LanguageId])
GO
ALTER TABLE [dbo].[AMP_Generic_Country] ADD CONSTRAINT [FK_AMP_Generic_Country_AMP_Generic_Currency] FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[AMP_Generic_Currency] ([CurrencyId])
GO
ALTER TABLE [dbo].[AMP_Generic_Country] ADD CONSTRAINT [FK_AMP_Generic_Country_AMP_Generic_GlobalLocation] FOREIGN KEY ([GlobalLocationId]) REFERENCES [dbo].[AMP_Generic_GlobalLocation] ([GlobalLocationId])
GO
