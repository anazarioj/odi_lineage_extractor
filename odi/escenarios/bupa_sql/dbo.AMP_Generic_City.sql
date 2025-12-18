CREATE TABLE [dbo].[AMP_Generic_City]
(
[CityId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CountryId] [int] NOT NULL,
[IsBorder] [bit] NULL,
[StateId] [int] NULL,
[StateCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MunicipalityId] [int] NULL,
[CityCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE TRIGGER [dbo].[Trg_SQLcm_AMP_Generic_City] ON [dbo].[AMP_Generic_City]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS EXTERNAL NAME [Trg_SQLcm_dbo_AMP_Generic_City].[CLRTriggers].[DMLTrigger]
GO
ALTER TABLE [dbo].[AMP_Generic_City] ADD CONSTRAINT [AMP_Generic_City_PK] PRIMARY KEY CLUSTERED ([CityId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_City] ADD CONSTRAINT [UIX_AMP_Generic_City] UNIQUE NONCLUSTERED ([CityId], [CountryId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_City_CountryID_Name_StateId] ON [dbo].[AMP_Generic_City] ([CountryId], [Name], [StateId]) INCLUDE ([CityId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AMP_Generic_City_MunicipalityId] ON [dbo].[AMP_Generic_City] ([MunicipalityId]) INCLUDE ([CityId], [Name], [IsBorder]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_City] ADD CONSTRAINT [AMP_Generic_Country_AMP_Generic_City_FK1] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[AMP_Generic_Country] ([CountryId])
GO
ALTER TABLE [dbo].[AMP_Generic_City] ADD CONSTRAINT [FK_AMP_Generic_City_AMP_Generic_State] FOREIGN KEY ([StateId]) REFERENCES [dbo].[AMP_Generic_State] ([StateId])
GO
GRANT ALTER ON  [dbo].[AMP_Generic_City] TO [setidentity_proxy]
GO
