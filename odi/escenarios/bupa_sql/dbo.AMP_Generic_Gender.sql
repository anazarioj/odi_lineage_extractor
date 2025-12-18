CREATE TABLE [dbo].[AMP_Generic_Gender]
(
[GenderId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMP_Generic_Gender] ADD CONSTRAINT [AMP_Generic_Gender_PK] PRIMARY KEY CLUSTERED ([GenderId]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
