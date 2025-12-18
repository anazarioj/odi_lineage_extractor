CREATE TABLE [dbo].[AMP_Generic_ContactPhone]
(
[ContactPhoneId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[ContactBaseId] [int] NOT NULL,
[PhoneNumber] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ext] [nchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneTypeId] [int] NOT NULL,
[CountryId] [int] NOT NULL,
[AreaCodeId] [int] NULL,
[UpdatedOn] [datetime] NULL,
[UpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE TRIGGER [dbo].[Trg_SQLcm_AMP_Generic_ContactPhone] ON [dbo].[AMP_Generic_ContactPhone]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS EXTERNAL NAME [Trg_SQLcm_dbo_AMP_Generic_ContactPhone].[CLRTriggers].[DMLTrigger]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactPhone] ADD CONSTRAINT [AMP_Generic_ContactPhone_PK] PRIMARY KEY CLUSTERED ([ContactPhoneId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_ContactPhone] ON [dbo].[AMP_Generic_ContactPhone] ([ContactBaseId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_ContactPhone] ADD CONSTRAINT [AMP_Generic_ContactPhone_AMP_Generic_ContactBase_FK1] FOREIGN KEY ([ContactBaseId]) REFERENCES [dbo].[AMP_Generic_ContactBase] ([ContactBaseId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactPhone] ADD CONSTRAINT [AMP_Generic_ContactPhone_AMP_Generic_PhoneType_FK3] FOREIGN KEY ([PhoneTypeId]) REFERENCES [dbo].[AMP_Generic_PhoneType] ([PhoneTypeId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactPhone] ADD CONSTRAINT [FK_AMP_Generic_ContactPhone_AMP_Generic_ContactPhone] FOREIGN KEY ([AreaCodeId]) REFERENCES [dbo].[AMP_Generic_AreaCode] ([AreaCodeId])
GO
ALTER TABLE [dbo].[AMP_Generic_ContactPhone] ADD CONSTRAINT [FK_AMP_Generic_ContactPhone_AMP_Generic_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO
