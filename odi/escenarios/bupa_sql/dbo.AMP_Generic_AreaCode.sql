CREATE TABLE [dbo].[AMP_Generic_AreaCode]
(
[AreaCodeId] [int] NOT NULL IDENTITY(1, 1) NOT FOR REPLICATION,
[AreaCode] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CityId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_AreaCode] ADD CONSTRAINT [PK_AMP_Generic_AreaCode] PRIMARY KEY CLUSTERED ([AreaCodeId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_AreaCode] ADD CONSTRAINT [FK_AMP_Generic_AreaCode_AMP_Generic_City] FOREIGN KEY ([CityId]) REFERENCES [dbo].[AMP_Generic_City] ([CityId])
GO
