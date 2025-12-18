CREATE TABLE [dbo].[AMP_Generic_GlobalLocation]
(
[GlobalLocationId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_GlobalLocation] ADD CONSTRAINT [AMP_Generic_GlobalLocation_PK] PRIMARY KEY CLUSTERED ([GlobalLocationId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
